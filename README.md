# Kanata CapsLock Productivity Layer

A Kanata keyboard config that adds a CapsLock navigation and editing layer for Windows.

## Features

Hold **CapsLock** for the nav layer, then press the key. Exceptions are noted in their group.

### Cursor movement

- `y`: Start of line. (Home).
- `U`: Page up. (PgUp).
- `I`: Cursor up. (Up).
- `O`: Page down. (PgDn).
- `P`: End of line. (End).
- `J`: Cursor left. (Left).
- `K`: Cursor down. (Down).
- `L`: Cursor right. (Right).
- `H`: Word left. (Ctrl+Left).
- `;`: Word right. (Ctrl+Right).
- `5`: Document start. (Ctrl+Home).
- `6`: Document end. (Ctrl+End).
- `7`: Page up. (PgUp).
- `8`: Page down. (PgDn).

### Deleting and new lines

- `/`: New line. (Enter).
- `V`: Delete character forward. (Delete).
- `,`: Delete character forward. (Delete).
- `B`: Delete character back. (Backspace).
- `N`: Delete character back. (Backspace).
- `M`: Delete word back. (Ctrl+Backspace).
- `.`: Delete word forward. (Ctrl+Delete).
- `4`: Delete line. (Home, Home, Shift+End, Delete).
- `Enter`: Smart new line. (End, Enter).

### Clipboard and editing

- `E`: Undo. (Ctrl+Z).
- `R`: Redo. (Ctrl+Y).
- `S`: Cut. (Ctrl+X).
- `D`: Copy. (Ctrl+C).
- `F`: Paste. (Ctrl+V).
- `A`: Save. (Ctrl+S).
- `X`: Find. (Ctrl+F).
### Selection

- `G`: Select all, then opens the S/D/F layer. (Ctrl+A).
- `T`: Select to end. (Shift+End). Double-tap: select to start. (Shift+Home). Each opens the S/D/F layer.
  - `S`: Cut the selection. (Ctrl+X).
  - `D`: Copy the selection. (Ctrl+C).
  - `F`: Delete the selection. (Delete).

The S/D/F layer lasts 1.5 seconds, or until the next key press.

### Surround

- `9`: Insert parentheses, cursor inside. (`( )`).
- `0`: Insert single quotes, cursor inside. (`' '`).
- `'`: Insert double quotes, cursor inside. (`" "`).
- `[`: Insert brackets, cursor inside. (`[ ]`).
- `]`: Insert braces, cursor inside. (`{ }`).

### Window layer

- `W`: Opens the window layer for 1.5 seconds, or until the next key press. Any key other than those below cancels it.
  - `E`: Task view. (Win+Tab).
  - `F`: Close window. (Alt+F4).

### Caps Lock toggle

- Double-tap right Shift: turns Caps Lock on or off. A single tap still acts as Shift. Expect a short delay (200 ms) on single taps.

### Other

- `Z`: Switch window. (Alt+Tab).
- `Q`: Escape. (Esc).
- `1`: Context menu. (Menu key).
- `F1`: Context menu. (Menu key).
- `Space`: Enter. (Enter).
- `2`: Rename. (F2).
- `3`: Equals sign. (`=`).
- `-`: Underscore. (Shift+-).
- `=`: Plus sign. (Shift+=).
- `Backspace`: Delete word back. (Ctrl+Backspace).
- `Tab` (with CapsLock held): Shift. (Shift).
Holding Shift with a nav key is not verified.

## Requirements

- Windows
- Kanata with the `winIOv2` build. Use `kanata_windows_gui_winIOv2_x64.exe` to run.

## Usage

1. Check the config:
   ```powershell
   .\Kanata\kanata_windows_tty_winIOv2_x64.exe --check --cfg .\Kanata\capsy.kbd
   ```
2. Run:
   ```powershell
   .\Kanata\kanata_windows_gui_winIOv2_x64.exe --cfg .\Kanata\capsy.kbd
   ```
3. Restart Kanata after each edit to `Kanata\capsy.kbd`.

**Emergency exit:** hold LCtrl + Space + Esc.

## Files

- `Kanata\capsy.kbd`: active config.
- `Kanata\kanata.kbd`: stock Kanata sample, unchanged.
