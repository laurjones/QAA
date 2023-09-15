#!/usr/bin/env python
# Author: LJ Jones

# Check out some Python module resources:
#   - https://docs.python.org/3/tutorial/modules.html
#   - https://python101.pythonlibrary.org/chapter36_creating_modules_and_packages.html
#   - and many more: https://www.google.com/search?q=how+to+write+a+python+module

'''This module is a collection of useful bioinformatics functions
written during the Bioinformatics and Genomics Program coursework.
You should update this docstring to reflect what you would like it to say'''

__version__ = "0.1"         # Read way more about versioning here:
                            # https://en.wikipedia.org/wiki/Software_versioning

def convert_phred(letter: str) -> int:
    '''Converts a single character into a phred score'''
    return ord(letter)-33

if __name__ == "__main__":
    '''Converts phred letters into phred scores.'''
    assert convert_phred("I") == 40, "wrong phred score for 'I'"
    assert convert_phred("C") == 34, "wrong phred score for 'C'"
    assert convert_phred("2") == 17, "wrong phred score for '2'"
    assert convert_phred("@") == 31, "wrong phred score for '@'"
    assert convert_phred("$") == 3, "wrong phred score for '$'"
    print("Your convert_phred function is working! Nice job.")

def qual_score(phred_score: str) -> float:
    '''Calculating average quality score for all.'''
    sum = 0 
    for x in phred_score:
        sum += convert_phred(x)
    average = sum/len(phred_score)
    return average

DNA_bases = set("ATCGNatcgn")
RNA_bases = set("AUCGNaucgn")
def validate_base_seq(seq,RNAflag=False):
    '''This function takes a string. Returns True if string is composed of only As, Ts (or Us if RNAflag), Gs, Cs. False otherwise. Case insensitive.'''
    return set(seq)<=(RNA_bases if RNAflag else DNA_bases)

if __name__ == "__main__":
    assert validate_base_seq("AATAGAT", False) == True, "Validate base seq does not work on DNA"
    assert validate_base_seq("AAUAGAU", True) == True, "Validate base seq does not work on RNA"
    assert validate_base_seq("TATUC",False) == False
    assert validate_base_seq("UCUGCU", False) == False
    print("Passed DNA and RNA tests")

def gc_content(DNA:str):
    '''Returns GC content of a DNA or RNA sequence as a decimal between 0 and 1.'''
    assert validate_base_seq(DNA)
    DNA = DNA.upper()
    DNAlength = len(DNA) #total length of genetic code 
    return ((DNA.count("G")+DNA.count("C"))/(DNAlength))

if __name__ == "__main__":    
    assert gc_content("GCGCGC") == 1
    assert gc_content("AATTATA") == 0
    assert gc_content("GCATCGAT") == 0.5
    print("correctly calculated GC content")

def oneline_fasta(file:str):
    '''This function takes a multi line fasta and converts it into a fasta that has a header and one sequence line'''
    with open(file, "r")as fh, open("online.fa", "w") as fout:
        print(fh.readline(), end="", file=fout) #this makes it so the print statement wont add a newline character 
        for line in fh:
            line=line.strip('\n')
            if line.startswith('>'): #for every header ex for the first one 
                print(f'\n{line}',file=fout)
            else:
                print(line,end="",file=fout)
        print("",file=fout)

def calc_median(sorted_list) -> list:
    '''This function calculates the median.'''
    length=len(sorted_list)
    if length%2==1:
        return sorted_list[length//2]
    else: #if even
        middle_right=length//2
        middle_left=middle_right-1
        return (sorted_list[middle_right] + sorted_list[middle_left]) / 2

my_dict = {"A":"T","T":"A","G":"C","C":"G","N":"N"}
def reverse_compliment_function(DNA:str) -> str:
    '''A function that reverse compliments barcodes.'''
    new_seq = ""
    for base in DNA:
        new_seq += my_dict[base]
    return (new_seq[::-1])