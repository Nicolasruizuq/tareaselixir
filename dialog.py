import sys
from tkinter import messagebox, Tk

root = Tk()
root.withdraw()

message = sys.argv[1] if len(sys.argv) > 1 else "Mensaje por defecto"
messagebox.showinfo("Mensaje", message)
