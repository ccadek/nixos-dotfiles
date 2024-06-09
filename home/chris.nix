{ config, pkgs, ... }:
let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
in
{
  /* The home.stateVersion option does not have a default and must be set */
  home.stateVersion = "24.05";
  #inputs.nixpkgs.follows = "nixpkgs";
  /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
  home.packages = [
    pkgs.fish
    pkgs.fzf
    pkgs.pyenv
  ];

  programs.git = {
    enable = true;
    userName = "cc";
    userEmail = "purzelification@gmail.com";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimDiffAlias = true;
    plugins = [
      (fromGitHub "v2.0" "tpope/vim-sleuth")
    ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -gx nvm_default_version "v19.2.0"
      set -gx ANDROID_SDK /home/purzel/Android/Sdk
      set -gx forgit_checkout_commit zzzzzzzzgcooooooo
      fish_add_path -g -p $HOME/fvm/default/bin
      fish_add_path -g -p $HOME/go/bin

      # docker config home
      # used to install docker-compose manually
      # check https://docs.docker.com/compose/install/linux/
      set -gx DOCKER_CONFIG "$HOME/.docker"

      # initialize pyenv
      pyenv init - | source

      # prompt setting

      set -U hydro_color_git red
      set -U hydro_color_pwd green
      set -U hydro_color_prompt blue
      set -U hydro_symbol_git_dirty " ✗"
    '';
    plugins = [
      { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
      { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
      { name = "forgit"; src = pkgs.fishPlugins.forgit.src; }
      {
        name = "Useful-Fish-Functions";
        src = pkgs.fetchFromGitHub {
          owner = "ccadek";
          repo = "Useful-Fish-Functions";
          rev = "a73f032bee9778e771e05a6fcfaabc86a93863dd";
          sha256 = "sha256-/I3vfYUM7vvOOk5C3ryiEJwpEMy5fgUA/z33dXDojNo=";
        };
      }
      {
        name = "wd";
        src = pkgs.fetchFromGitHub {
          owner = "fischerling";
          repo = "plugin-wd";
          rev = "ac46fb36724fa17d97965f9829ae29c61ec1e109";
          sha256 = "sha256-pRTEU9T+WkFxTdeZR1EZgW9FCeBsb3VbUvwFD27ZkZ4=";
        };
      }
      {
        name = "nvm";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "nvm.fish";
          rev = "b8edb1ee24cbbf7259196b0cb3c6c4ab65b07929";
          sha256 = "sha256-7JxIQSseBv81SSpWH1pufx8fh9EQhbo3r2nVVREwc58=";
        };
      }
    ];
  };
}
