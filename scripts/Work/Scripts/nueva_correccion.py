#!/usr/bin/env python3

import sys
import os
import subprocess
import datetime

DOTFILES_DIR = os.path.expanduser("~/dotfiles")
ESPANSO_MATCH_DIR = os.path.join(DOTFILES_DIR, "espanso/.config/espanso/match")
CORRECT_FILE = os.path.join(ESPANSO_MATCH_DIR, "correct.yml")

def main():

    if len(sys.argv) != 3:
        print("Uso: python nueva_correccion.py <error> <correccion>")
        print("Ejemplo: python nueva_correccion. 'peurco' 'puerco'")
        sys.exit(1)

    commit_date = datetime.datetime.now()

    message = add_entry(sys.argv[1], sys.argv[2])

    auto_commit(message, commit_date)
    print(f"✅ commited with {message} at {commit_date}")

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

    commit_message = (f"✅ Agregado: '{trigger}' -> '{replace}'")
    print(commit_message)

    return commit_message

def auto_commit(message, commit_date):
    subprocess.run(["git", "-c", f"{DOTFILES_DIR}", "-a", "-m", f"{commit_date} - message"])
    subprocess.run(["git", "push"])


if __name__ == "__main__":
    main()
