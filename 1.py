#!/usr/bin/env python
# -*- coding: utf-8 -*-

class Student(object):

    @property
    def score(self):
        return self._score

    @score.setter
    def score(self, value):
        if not isinstance(value, int):
            raise ValueError('score must be an integer!')
        if value < 0 or value > 100:
            raise ValueError('score must between 0 ~ 100!')
        self._score = value

from datetime import datetime
datetime.now()
##<<<<<<< HEAD
add loacl a new line
=======
add a new line
##>>>>>>> baa0845747974bd73ff4f566375cfc70fb33c6df
