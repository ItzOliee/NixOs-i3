{ config, pkgs, lib, ... }:

let
  firefoxProfile = "${config.home.homeDirectory}/.mozilla/firefox/rlekpss8.default";
   chromeDir = "${firefoxProfile}/chrome";
in {
  home.activation.createFirefoxChromeDir = lib.hm.dag.entryBefore ["writeBoundary"] ''
    mkdir -p "${chromeDir}"
  '';

  home.file = {
    # Write userChrome.css into the chrome folder
    "${chromeDir}/userChrome.css".text = ''


    :root {
  --accent: var(--pywal-color7);
  --main-bg: var(--pywal-background);
  --dark-bg: var(--pywal-color0);
  --light-bg: var(--pywal-color1);

  --primary: var(--pywal-color7);
  --primary-alt: var(--pywal-color6);
  --primary-grad: linear-gradient(90deg, var(--primary), var(--primary-alt));

  --toolbar-bgcolor: var(--main-bg) !important;
  --lwt-sidebar-background-color: var(--dark-bg) !important;
  --lwt-sidebar-text-color: var(--pywal-foreground, rgba(255, 255, 255, 0.5));
}

* {
  font-family: "Hack Nerd Font" !important;
  font-size: 14px !important;
}

element {
  --lwt-sidebar-text-color: var(--pywal-foreground, rgba(255, 255, 255, 0.5));
}

#TabsToolbar #firefox-view-button[open] > .toolbarbutton-icon:-moz-lwtheme,
.tab-background[selected]:-moz-lwtheme {
  outline: none !important;
}

/* Compact bookmarks and folders */
#folderTree > treechildren::-moz-tree-row,
#bookmarks-view > treechildren::-moz-tree-row {
  height: 19px !important;
  min-height: 19px !important;
}

/* Toolbar spacing */
#nav-bar toolbarspring {
  min-width: 10px !important;
  max-width: 20px !important;
}

#nav-bar-customization-target {
  background-color: var(--main-bg) !important;
  -moz-appearance: none !important;
  background-image: none !important;
  border: none !important;
  color: var(--pywal-foreground) !important;
}

#main-window,
#navigator-toolbox,
#PersonalToolbar,
#sidebar-box,
#tabbrowser-tabs,
#TabsToolBar {
  background-color: var(--main-bg) !important;
  -moz-appearance: none !important;
  background-image: none !important;
  border: none !important;
  color: var(--pywal-foreground) !important;
}

#tabbrowser-tabs {
  --tab-loading-fill: none !important;
}

#TabsToolbar .tabbrowser-tab[selected] {
  color: var(--main-bg) !important;
}

#TabsToolbar .tabbrowser-tab {
  color: rgba(194, 205, 226, 0.918) !important;
}

.tab-content {
  padding: 14px 20px !important;
}

.tab-background {
  background-color: var(--main-bg) !important;
  margin: 12px !important;
  margin-right: 0px !important;
  border-radius: 10px !important;
  color: var(--pywal-foreground) !important;
  border: 6px solid var(--main-bg) !important;
  transition: all .2s !important;
}

#tabbrowser-arrowscrollbox .tabbrowser-tab:last-of-type .tab-background,
#tabs-newtab-button {
  margin-right: 10px !important;
}

.tabbrowser-tab:hover .tab-background {
  background-color: var(--dark-bg) !important;
  border-color: var(--dark-bg) !important;
}

.tab-background[selected="true"] {
  background: var(--primary-grad) !important;
  border: 0px solid var(--main-bg) !important;
  color: var(--main-bg) !important;
  box-shadow: 1px 1px 10px rgba(0, 0, 0, .2);
}

.tab-line,
.tabbrowser-tab::before,
.tabbrowser-tab::after,
.tab-loading-burst {
  display: none !important;
}

.tab-close-button {
  border-radius: 10px !important;
}

#identity-box,
#tracking-protection-icon-container,
#urlbar-background,
#whats-new-menu-button,
#star-button,
#pocket-button,
#pageActionSeparator,
#pageActionButton,
#reader-mode-button {
  display: none !important;
}

#back-button>.toolbarbutton-icon {
  transform: scale(.85, .85) !important;
  animation: none !important;
  border: none !important;
  box-shadow: none !important;
}

#back-button:not(:hover),
#back-button:not(:hover) > .toolbarbutton-icon {
  background: none !important;
}

#back-button:hover,
#back-button:hover > .toolbarbutton-icon {
  border-radius: 8px !important;
}

.toolbarbutton-icon,
.toolbarbutton-animatable-box {
  transition: all .2s !important;
  background: transparent;
  border-radius: 6px !important;
}

/* Hover Styles */
#PersonalToolbar .toolbarbutton-1:not([disabled="true"], [checked], [open], :active):hover,
#tabbrowser-arrowscrollbox:not([scrolledtostart="true"])::part(scrollbutton-up):hover,
#tabbrowser-arrowscrollbox:not([scrolledtoend="true"])::part(scrollbutton-down):hover,
toolbarbutton.bookmark-item:not(.subviewbutton, [disabled="true"], [open]):hover,
.toolbarbutton-1:not([disabled="true"], [checked], [open], :active):hover > .toolbarbutton-icon,
.toolbarbutton-1:not([disabled="true"], [checked], [open], :active):hover > .toolbarbutton-text {
  background: var(--primary-grad) !important;
  border-radius: 8px !important;
}

#PersonalToolbar .toolbarbutton-1:not([disabled="true"]):is([open], [checked], :hover:active),
#tabbrowser-arrowscrollbox:not([scrolledtostart="true"])::part(scrollbutton-up):hover:active,
#tabbrowser-arrowscrollbox:not([scrolledtoend="true"])::part(scrollbutton-down):hover:active,
toolbarbutton.bookmark-item:hover:active:not(.subviewbutton, [disabled="true"]),
.toolbarbutton-1:not([disabled="true"]):is([open], [checked], :hover:active) > .toolbarbutton-icon {
  background: var(--dark-bg) !important;
}

#PanelUI-button {
  background-color: var(--main-bg) !important;
  border-image-source: none !important;
  border-inline-start: 0px !important;
  margin-inline-start: 0px !important;
  border-image-slice: 0 !important;
}

#urlbar-results {
  background-color: var(--main-bg) !important;
  border-radius: 10px !important;
}

.urlbarView-body-inner {
  border-top: none !important;
}

#nav-bar {
  border-bottom: 0px !important;
  box-shadow: none !important;
}

#urlbar ::-moz-selection,
.searchbar-textbox ::-moz-selection {
  background-color: #dddddd !important;
  color: #000 !important;
}

#urlbar,
.searchbar-textbox {
  color: var(--pywal-foreground) !important;
}

#tabbrowser-tabpanels {
  background-color: white !important;
}
    

   '';
  };
}
