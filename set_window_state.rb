# set_windows_state.rb
# Author: Luis Fernando Lopes
# Created at: 2019-08-20T17:31
# Purpose: See Samples.

require 'ffi'

puts "Samples\n-------\n\n" +
     "To hidden window:\n" +
     "  set_window_state \"Command Prompt\" 0\n\n" +
     "To restore the window:\n" +
     "  set_window_state \"Command Prompt\" 1\n\n" +
     "To minimize the window:\n" +
     "  set_window_state \"Command Prompt\" 2\n\n" +
     "To maximize the window:\n" +
     "  set_window_state \"Command Prompt\" 3\n\n"


module Win32
   extend FFI::Library
   ffi_lib 'user32'
#    ffi_convention :stdcall
   attach_function :FindWindowA, [ :int, :string ], :int
   attach_function :ShowWindow, [ :int, :int ], :int
end

win_handle = Win32.FindWindowA(0, ARGV[0])

Win32.ShowWindow(win_handle, ARGV[1].to_i)
