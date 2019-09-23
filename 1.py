#!/usr/bin/env python
# -*- coding: utf-8 -*-

class Student(object):
    def __init__(self, name, score):
        self.name = name 
        self.score = score 

    def print_score(self):
        print('%s %s' %(self.name, self.score))


if __name__ == '__main__':
    bart = Student('gjw', 96)
    bart.print_score()


