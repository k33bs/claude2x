# Claude 2X

A fun, animated landing page that tracks when Claude's 2X usage limits are active during the March 13-28, 2026 promotion.

**This is a community project. We are not affiliated with, endorsed by, or associated with Anthropic or Claude in any way.** This page was built purely for fun by AI enthusiasts who wanted a cool way to see when 2X limits are live.

## What it does

- **Live countdown** showing when 2X usage limits are active vs peak hours
- **3D starfield** with hyperspace warp effect on hover
- **WebGL liquid noise** background with purple/gray theme switching
- **Automatic state detection** - knows if it's off-peak (2X active), peak hours, or if the promotion has ended
- **Timezone aware** - shows your local timezone

## The 2X Promotion

From March 13-28, 2026, Claude Pro users get doubled five-hour usage limits during off-peak hours:

- **2X Active**: Outside 8 AM-2 PM ET / 5-11 AM PT / 12-6 PM GMT on weekdays, plus all weekend
- **Standard Limits**: 8 AM-2 PM ET / 5-11 AM PT / 12-6 PM GMT on weekdays

Applies to: Claude Web, Desktop, Mobile, Cowork, Claude Code, Excel Add-in, PowerPoint Add-in.

## Tech

Zero dependencies. Single HTML file with embedded CSS, WebGL shader, and Canvas 2D starfield.

- WebGL Simplex noise shader for animated background
- Canvas 2D with 3D z-projection for starfield
- Velocity-based star streaks with smooth warp easing
- `html-minifier-terser` for production builds
- Deployed to Cloudflare Pages

## Build & Deploy

```bash
# Build (minifies to dist/)
./build.sh

# Build + deploy to Cloudflare Pages
./build.sh --deploy
```

## Community

- **Discord**: [Join us](https://discord.gg/4zcfF5J4s4) - get notified when 2X goes live
- **clanker.watch** - AI service uptime monitoring
- **clanker.report** - Developer sentiment dashboard
- **clanker.win** - AI benchmarks

## Disclaimer

This is an unofficial community project. Claude, Claude Pro, and Anthropic are trademarks of Anthropic, PBC. We just think 2X limits are cool and wanted a fun page for it.
