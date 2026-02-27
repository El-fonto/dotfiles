#!/usr/bin/env python3

import sys
import os

ESPANSO_MATCH_DIR = os.path.expanduser("~/dotfiles/espanso/.config/espanso/match")
CORRECT_FILE = os.path.join(ESPANSO_MATCH_DIR, "correct.yml")

def add_entry(trigger, replace):
    entry = f"""
- trigger: "{trigger}"
  replace: "{replace}"
  propagate_case: true
  word: true
"""
    if not os.path.exists(CORRECT_FILE):
        with open(CORRECT_FILE, "w") as f:
            f.write("matches:\n")

    with open(CORRECT_FILE, "a") as f:
        f.write(entry)
    print(f"✅ Agregado: '{trigger}' -> '{replace}'")

# TODO: commit to github with auto save message with the word printed
def auto_commit(message):
    pass

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Uso: python nueva_correccion.py <error> <correccion>")
        print("Ejemplo: python nueva_correccion. 'peurco' 'puerco'")
        sys.exit(1)
    add_entry(sys.argv[1], sys.argv[2])
