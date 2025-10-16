class Colors(object):
    '''
    Colors class:
    Reset all colors with colors.reset
    To enable/disable color invoke with boolean, True/False
    ie., cstate is a boolean to control whether color text is used or not.
    '''

    def __init__(self, cstate):
        self.cstate = cstate

        if cstate:
            self.reset = '\033[0m'
            self.bold = '\033[01m'
            self.disable = '\033[02m'
            self.underline = '\033[04m'
            self.reverse = '\033[07m'
            self.strikethrough = '\033[09m'
            self.invisible = '\033[08m'
            # Foreground colors
            self.fg_black = '\033[30m'
            self.fg_red = '\033[31m'
            self.fg_green = '\033[32m'
            self.fg_orange = '\033[33m'
            self.fg_blue = '\033[34m'
            self.fg_purple = '\033[35m'
            self.fg_cyan = '\033[36m'
            self.fg_lightgrey = '\033[37m'
            self.fg_white = '\033[37m'
            self.fg_darkgrey = '\033[90m'
            self.fg_lightred = '\033[91m'
            self.fg_lightgreen = '\033[92m'
            self.fg_yellow = '\033[93m'
            self.fg_lightblue = '\033[94m'
            self.fg_pink = '\033[95m'
            self.fg_lightcyan = '\033[96m'
            # Background colors
            self.bg_black = '\033[40m'
            self.bg_red = '\033[41m'
            self.bg_green = '\033[42m'
            self.bg_yellow = '\033[43m'
            self.bg_blue = '\033[44m'
            self.bg_purple = '\033[45m'
            self.bg_cyan = '\033[46m'
            self.bg_lightgrey = '\033[47m'
        else:
            self.reset = ''
            self.bold = ''
            self.disable = ''
            self.underline = ''
            self.reverse = ''
            self.strikethrough = ''
            self.invisible = ''
            # Foreground colors
            self.fg_black = ''
            self.fg_red = ''
            self.fg_green = ''
            self.fg_orange = ''
            self.fg_blue = ''
            self.fg_purple = ''
            self.fg_cyan = ''
            self.fg_lightgrey = ''
            self.fg_white = ''
            self.fg_darkgrey = ''
            self.fg_lightred = ''
            self.fg_lightgreen = ''
            self.fg_yellow = ''
            self.fg_lightblue = ''
            self.fg_pink = ''
            self.fg_lightcyan = ''
            # Background colors
            self.bg_black = ''
            self.bg_red = ''
            self.bg_green = ''
            self.bg_yellow = ''
            self.bg_blue = ''
            self.bg_purple = ''
            self.bg_cyan = ''
            self.bg_lightgrey = ''
