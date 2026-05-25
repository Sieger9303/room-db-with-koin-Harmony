## room-db-with-koin-Harmony UI sync

Files changed:
- `entry/src/main/cangjie/app/prgghale/roomdb/app/RoomDbRoot.cj`
- `entry/src/main/cangjie/app/prgghale/roomdb/composables/Scaffolds.cj`
- `entry/src/main/cangjie/app/prgghale/roomdb/composables/BottomBar.cj`
- `entry/src/main/cangjie/app/prgghale/roomdb/composables/Images.cj`
- `entry/src/main/cangjie/app/prgghale/roomdb/ui/home/HomeScreen.cj`
- `entry/src/main/cangjie/app/prgghale/roomdb/ui/userlist/UsersScreen.cj`
- `entry/src/main/cangjie/app/prgghale/roomdb/ui/favorite/FavoriteScreen.cj`
- `entry/src/main/cangjie/app/prgghale/roomdb/ui/search/SearchScreen.cj`
- `entry/src/main/cangjie/app/prgghale/roomdb/ui/profile/ProfileScreen.cj`
- `entry/src/main/resources/base/media/ic_add.svg`
- `entry/src/main/resources/base/media/ic_account_box.svg`
- `entry/src/main/resources/base/media/ic_star.svg`
- `entry/src/main/resources/base/media/ic_person.svg`
- `entry/src/main/resources/base/media/ic_search.svg`
- `entry/src/main/resources/base/media/ic_favorite_border.svg`
- `entry/src/main/resources/base/media/ic_delete.svg`
- `entry/src/main/resources/base/media/ic_chevron_right.svg`
- `entry/src/main/resources/base/media/ic_downloading.svg`

Build result:
- BUILD SUCCESSFUL via `python ".agents/skills/harmonyos-build/build.py" --project-root "D:/Kotlintranslate/room-db-with-koin-Harmony"`

Final status:
- Replaced the large top-bar search button with a centered title bar layout and a small icon action.
- Replaced capsule bottom buttons with icon + label navigation items.
- Added monochrome SVG icon resources for navigation and row actions.
- Reworked user list, favorites, search, and profile screens toward the Kotlin layout.
- `RoomDbContext.bootstrap()` remains on the real UI path in `RoomDbRoot.onAppear` so professions/persistence still initialize before screen usage.
- Add, delete, favorite toggle, and search flows remain wired to `RoomDbContext` persistence methods.
- Build verified successfully. Device/emulator UI capture was not rerun in this session.
