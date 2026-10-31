# Charm After Dark

A custom Omarchy theme inspired by Charm's terminal tools: dark aubergine,
purple-to-pink window borders, mint and pink accents, and a muted lavender bar
with dark plum text. Includes the AI-generated Satin Flow wallpaper.

![Satin Flow wallpaper](backgrounds/00-satin-flow.png)

## Theme files

- `colors.toml`: terminal and application palette, including gradient borders.
- `shell.toml`: lavender bar and popups, readable selections, and bar dimensions.
- `icons.theme`: Yaru-magenta icons (requires that icon theme to be installed).
- `backgrounds/00-satin-flow.png`: wallpaper.

Uses the Lua/Quickshell edition of Omarchy. Older Waybar-based releases need
different bar configuration. Tested in the Omarchy Windows preview.

## Install from a local checkout

Back up an existing theme directory with this name before copying.

```bash
mkdir -p ~/.config/omarchy/themes/charm-after-dark
cp colors.toml shell.toml icons.theme ~/.config/omarchy/themes/charm-after-dark/
cp -r backgrounds ~/.config/omarchy/themes/charm-after-dark/
omarchy theme set charm-after-dark
```

Once hosted on GitHub, `omarchy theme install <repository-url>` can install the
base theme. The optional desktop settings below are separate from the theme.

## Optional desktop customization

`extras/` preserves the additional desktop settings built with this theme.
Review and merge them into your own configuration rather than replacing files
that contain personal settings. Back up each destination before changing it.

### Workspace highlight

Copy `extras/manifest.json` and `extras/Workspaces.qml` into
`~/.config/omarchy/plugins/charm.workspaces/`. Then run:

```bash
omarchy-shell shell rescanPlugins
omarchy plugin enable charm.workspaces
```

The widget uses a purple pill with bright text to highlight the active workspace.

### Bar layout

`extras/shell.json` is a reference layout: workspaces left, clock center, status
controls right. Merge its `bar` settings into `~/.config/omarchy/shell.json`;
preserve your existing idle configuration and other preferences. This reference
uses `charm.workspaces`, so install that widget first.

Keep `bar.transparent` false: tinted translucency is controlled by the
`background-alpha` value in the theme's `shell.toml`.

### Blur, corners, and workspace transitions

Append or merge `extras/looknfeel.lua` into `~/.config/hypr/looknfeel.lua`.
It adds gentle blur, 6px corners, subtle shadows, and a 220ms slide-and-fade
workspace transition. Then validate:

```bash
hyprctl reload
hyprctl configerrors
```

For 95% terminal background opacity, configure your terminal separately:

- Foot: `alpha=0.95` under `[colors-dark]` in `~/.config/foot/foot.ini`.
- Alacritty: `opacity = 0.95` under `[window]`.
- Ghostty: `background-opacity = 0.95`.
- Kitty: `background_opacity 0.95`.

Open a new Foot terminal after changing its configuration.

Restart the shell after installing the optional widget to avoid stale QML caches:

```bash
omarchy restart shell
```

## Revert

To switch the base theme back:

```bash
omarchy theme set "Tokyo Night"
```

Optional desktop changes survive theme switches. Restore your saved user
configuration files and reload Hyprland and the shell to undo those changes.

## Credits

Inspired by [Charm](https://charm.land/) and its
[CharmTone](https://github.com/charmbracelet/tone) color system. This is an
independent custom theme. The optional workspace widget derives from Omarchy's
built-in Workspaces widget; upstream licensing applies to that code.

Satin Flow was created using OpenAI's built-in image generator. Its prompt
summary is in `wallpaper-prompt.txt`.
