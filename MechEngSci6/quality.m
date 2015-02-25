function [value] = quality(phi,liquid,gas)
value = (1-phi)*liquid + phi*gas;