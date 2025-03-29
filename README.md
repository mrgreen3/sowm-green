# sowm-green 

<a href="https://i.postimg.cc/g2kB4xQ1/photo-2025-03-29-14-47-52.jpg"><img src="https://i.postimg.cc/g2kB4xQ1/photo-2025-03-29-14-47-52.jpg" width="43%" align="right"></a>

Forked [sowm](https://github.com/dylanaraps/sowm) project messed up by MrGreen 

An itsy bitsy floating window manager (*220~ sloc!*).

- Floating only.
- Fullscreen toggle.
- Window centering.
- Mix of mouse and keyboard workflow.
- Focus with cursor.

- Alt-Tab window focusing.
- All windows die on exit.
- No window borders.
- [No ICCCM](https://web.archive.org/web/20190617214524/https://raw.githubusercontent.com/kfish/xsel/1a1c5edf0dc129055f7764c666da2dd468df6016/rant.txt).
- No EWMH.
- etc etc etc


<br>


## Default Keybindings

**Window Management**

| combo                      | action                 |
| -------------------------- | -----------------------|
| `Mouse`                    | focus under cursor     |
| `MOD1` + `Left Mouse`      | move window            |
| `MOD1` + `Right Mouse`     | resize window          |
| `MOD1` + `f`               | maximize toggle        |
| `MOD1` + `c`               | center window          |
| `MOD1` + `q`               | kill window            |
| `MOD1` + `1-6`             | desktop swap           |
| `MOD1` + `Shift` +`1-6`    | send window to desktop |
| `MOD1` + `TAB` (*alt-tab*) | focus cycle            |

**Programs**

| combo                    | action           | program        |
| ------------------------ | ---------------- | -------------- |
| `MOD1` + `Return`        | terminal         | `alacritty`    |
| `MOD1` + `d`             | dmenu            | `dmenu_run`    |


## Dependencies

- `xlib` (*usually `libX11`*).


## Installation

1) Copy `config.def.h` to `config.h` and modify it to suit your needs.
2) Run `make` to build `sowm`.
3) Copy it to your path or run `make install`.
    - `DESTDIR` and `PREFIX` are supported.
4) (Optional) Apply patch with `git apply patches/patch-name`
    - In case of applying multiple patches, it has to be done **manually**.

If you are using a log in manager then you will need the following to `/usr/share/xsessions/sowm.desktop`. 

It is still recommended to start `sowm` from `.xinitrc`

```
[Desktop Entry]
Name=sowm
Comment=This session runs sowm as desktop manager
Exec=sowm
Type=Application
```


## Thanks

- [2bwm](https://github.com/venam/2bwm)
- [sowm](https://github.com/dylanaraps/sowm)
- [SmallWM](https://github.com/adamnew123456/SmallWM)
- [berry](https://github.com/JLErvin/berry)
- [catwm](https://github.com/pyknite/catwm)
- [dminiwm](https://github.com/moetunes/dminiwm)
- [dwm](https://dwm.suckless.org)
- [monsterwm](https://github.com/c00kiemon5ter/monsterwm)
- [openbox](https://github.com/danakj/openbox)
- [possum-wm](https://github.com/duckinator/possum-wm)
- [swm](https://github.com/dcat/swm)
- [tinywm](http://incise.org/tinywm.html)
