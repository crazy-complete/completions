#!/usr/bin/env python3

import sys
import crazy_complete

cmdline = crazy_complete.yaml_source.load_from_file(sys.argv[1])

del cmdline.options[0] # del --option
del cmdline.options[0] # del -option

# TODO --verbose, --alsa-audio-device

FILE_OPTIONS = [
    '--demuxdump-file',
    '--keystore-file',
    '--logo-file',
    '--marq-file',
    '--audiofile-file',
    '--svg-template-file',
    '--shm-file',
    '--yuv-file',
    '--logfile',
    '--sub-file',
    '--pidfile',
    '--config',
]

SPECIAL_KEYS = [
    "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
    "Up", "Down", "Left", "Right", "End", "Home",
    "Space", "Enter", "Tab", "Esc", "Page Up", "Page Down", "Backspace",
    "Insert", "Delete",
]

SIMPLE_KEYS = [
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

ALL_KEYS = []

for k in SIMPLE_KEYS + SPECIAL_KEYS:
    # TODO: meta, command, super?
    ALL_KEYS.append(k)
    ALL_KEYS.append('alt-'+k)
    ALL_KEYS.append('shift-'+k)
    ALL_KEYS.append('ctrl-'+k)
    ALL_KEYS.append('meta-'+k)

def choices_from_metavar(s):
    s = s.replace('{', '')
    s = s.replace('}', '')
    choices = s.split(',')
    choices = [s.strip() for s in choices]

    if '(' in choices[0]:
        choices_with_desc = {}
        for choice in choices:
            val, desc = choice.split('(', maxsplit=1)
            val = val.strip()
            desc = desc.strip()
            desc = desc[0:-1] # remove ')'
            choices_with_desc[val] = desc
        return choices_with_desc

    return choices

def parse_integer_range(s):
    s = s.replace('<integer [', '')
    s = s.replace(']>', '')
    start, stop = s.split(' .. ')
    return (int(start), int(stop))

def parse_float_range(s):
    s = s.replace('<float [', '')
    s = s.replace(']>', '')
    start, stop = s.split(' .. ')
    return (float(start), float(stop))

for option in cmdline.options:
    if option.metavar and option.metavar.startswith('{'):
        option.complete = ['choices', choices_from_metavar(option.metavar)]

    elif option.metavar and option.metavar.startswith('<integer ['):
        start, stop = parse_integer_range(option.metavar)
        if stop < 5000:
            option.complete = ['range', start, stop]

    elif option.option_strings[0] in FILE_OPTIONS:
        option.complete = ['file']
        FILE_OPTIONS.remove(option.option_strings[0])

    elif option.option_strings[0].startswith('--key-') or option.option_strings[0].startswith('--global-key-'):
        option.complete = ['choices', ALL_KEYS]


if len(FILE_OPTIONS):
    print('Got non-empty FILE_OPTIONS:', FILE_OPTIONS)

with open(sys.argv[2], 'w', encoding='UTF-8') as fh:
    fh.write(crazy_complete.yaml_source.commandline_to_yaml(cmdline))
