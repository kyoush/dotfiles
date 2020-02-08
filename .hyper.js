// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    updateChannel: 'stable',
    fontSize: 24,
    fontFamily: 'Ricty Diminished, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    fontWeight: 'normal',
    fontWeightBold: 'normal',
    lineHeight: 1,
    letterSpacing: 0,
    cursorColor: 'rgba(255, 0, 85, 1)',
    cursorAccentColor: '#000',
    cursorShape: 'BLOCK',
    cursorBlink: true, // カーソル点滅するか
    foregroundColor: '#fff',
    backgroundColor: '#000',
    selectionColor: 'rgba(248,28,229,0.3)',
    borderColor: '#333',
    css: '.line { margin-bottom: 12px; font-size: 15px } .wrapper { padding: 0px 20px 0px 3px;}',
    termCSS: '',
    showHamburgerMenu: '',
    showWindowControls: '',
    padding: '5px 20px 25px 20px',
    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
    },
    shells: [
      {name: "CMD", shell: 'cmd.exe', args: ['--login'], default: true},
      {name: "Bash", group: [
        {name: "WSL", shell: 'C:\\Windows\\System32\\bash.exe', args: ['--login']},
        {name: "Git", shell: 'C:\\Program Files\\Git\\bin\\bash.exe', args: ["--login"]},
      ]},
      {name: "Powershell", shell: "powershell.exe"}
    ],
    env: { LANG: 'ja_JP.UTF-8' },
    bell: 'SOUND',
    copyOnSelect: false,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: 'vertical',
    webGLRenderer: true,

    hyperWindowSize: {
      width: 1000,
      height: 700,
      startX: 900,
      startY: 70,
    },

    opacity: {
      focus:0.93,
      blur: 0.4
    },

    hyperBorder: {
      borderColors:['random', 'random'],
      animate: {
        duration:'1s',
      },
    },

    MaterialTheme: {
      // Set the theme varient,
      // OPTIONS: 'Darker', 'Palenight', 'Ocean', '
      theme: 'Darker',
      // [Optional] Set the rgba() app background opacity, useful when enableVibrance is true
      // OPTIONS: From 0.1 to 1
      backgroundOpacity: '1',
      // [Optional] Set the accent color for the current active tab
      accentColor: '#64FFDA',
      vibrancy: 'dark',
    },

    overlay: {
      alwaysOnTop: false,
      animate: false,
      hasShadow: false,
      hideDock: false,
      hideOnBlur: true,
      hotkeys: ['Ctrl+Space'],
      position: 'top',
      primaryDisplay: true,
      resizable: true,
      startAlone: false,
      startup: false,
      size: 1,
      tray: true,
      unique: false
    },
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyper-pane", //画面分割
//    "hyper-tabs-enhanced", //良い感じのタブに
    "hyper-statusline", //下側にステータスを表示
    "hypercwd", //新しいタブを開いたときに同じディレクトリに移動
    "hyperborder", //ターミナルに枠を付ける
    "hyper-material-theme", //Material Theme for Hyper!
    "hyper-window-size", //ウィンドウサイズ
    "hyper-highlight-active-pane", //Highlight the currently active pane
    "hyper-launch-menu", //Launch more than one kind of shell
    "hyper-tab-icons-plus", //タブにSVGアイコンを表示
    "hyper-opacity", //透過
    "hyperterm-overlay", //terminal everywhere!
  ],


  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins:[],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};
