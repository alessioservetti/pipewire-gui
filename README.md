# PipeWire GUI

A patchbay for [PipeWire](https://pipewire.org) / WirePlumber on the Linux desktop, built with
Flutter. It shows the audio graph like qpwgraph, tells you the sample rate each node really runs
at (and which node resamples), and lets you edit the graph: links, volumes, default devices,
virtual sinks and captures, graph clock.

Everything goes through the standard PipeWire command line tools: no daemon, no custom PipeWire
module, nothing to configure. What the app shows is what `pw-dump` and the PipeWire profiler
report.

## Features

**Patchbay**
- Nodes with their ports and links, laid out left to right following the audio flow.
- Drag from a port to a compatible one to create a link; click a link and press Delete to remove it.
- Zoom with the mouse wheel or the buttons, "fit" to see the whole graph.
- Nodes stay where you put them, also across restarts (positions saved per node).
- The two halves of a loopback (same `node.link-group`) are stacked and joined by a dashed line.

**Real sample rates**
- Rate of each node (negotiated format) and rate of its group, measured by the PipeWire profiler
  (`pw-top`): a node converting between the two is highlighted as resampling.
- Rate requested by a pactl module (`rate=`) shown when it is not the one in effect.

**Editing**
- Volume and mute of every node that has a volume.
- Default sink and default source: star on the node, highlighted border.
- New virtual nodes, with a live preview of the command:
  - null sink (`module-null-sink`);
  - loopback sink (`module-remap-sink`): forwards to an output with a passive stream, so the
    device can still change rate when nothing plays;
  - capture (`module-remap-source`) from a source or a sink monitor;
  - channels and channel maps, explicit rate, `resample.disable`, extra node properties.
- Removal of the nodes created by a pactl module or by a `pw-loopback` process.

**Graph clock**, applied live through the `settings` metadata (nothing is restarted)
- Rate of every running driver.
- Forced rate, allowed rates, default rate.
- Forced quantum, quantum, min and max quantum.

## Requirements

Runtime: PipeWire with WirePlumber and pipewire-pulse, and these commands in `PATH`:
`pw-dump`, `pw-top`, `pw-link`, `pw-cli`, `pw-metadata`, `wpctl`, `pactl`, `stdbuf`.

On Debian / Ubuntu / Kubuntu:

```sh
sudo apt install pipewire-bin wireplumber pulseaudio-utils
```

## Install

Download `pipewire-gui-<version>-linux-x64.tar.gz` from
[Releases](https://github.com/alessioservetti/pipewire-gui/releases), extract it and run
`pipewire_gui`:

```sh
tar -xzf pipewire-gui-v0.1.0-linux-x64.tar.gz
./pipewire-gui-v0.1.0-linux-x64/pipewire_gui
```

Built on Ubuntu 24.04 (x86_64): it runs on distributions with glibc 2.39 or newer.

## Build

A recent stable Flutter SDK (Dart 3.10 or newer) and the Linux desktop toolchain:

```sh
sudo apt install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev

flutter pub get
dart run build_runner build -d
flutter run -d linux                # development
flutter build linux --release       # build/linux/x64/release/bundle
```

### Desktop entry and icon

```sh
linux/packaging/install.sh
```

Installs the icon in `~/.local/share/icons` and a desktop entry named after the application id
pointing at the release bundle. On Wayland the window icon comes from that desktop entry. Run it
again if the project folder moves.

## How it works

- The graph is read every second with `pw-dump` (plus `pactl list modules short` for the
  arguments of the pactl modules) and turned into immutable snapshots: widgets rebuild only when
  what they show changes.
- Group rates come from a long-running `pw-top -b`, one table per profiler cycle.
- Changes run `pw-link`, `wpctl`, `pactl`, `pw-cli` or `pw-metadata`, then the graph is read again.
- Node positions are kept in `~/.local/state/pipewire_gui/node_positions.json`.

## Project structure

```
lib/
  core/        process runner, theme, shared widgets
  features/
    pipewire_graph/  CLI services, pw-dump parsing, domain models, graph providers
    patchbay/        canvas, nodes, links, virtual nodes, saved positions
    graph_clock/     clock readout and settings
```

Feature-first layout with Riverpod (code generation) and freezed models.

## License

[MIT](LICENSE)
