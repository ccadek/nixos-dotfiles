{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = [
      {
        name = "vim-sleuth";
        src = pkgs.fetchFromGitHub {
          owner = "tpope";
          repo = "vim-sleuth";
          rev = "1d25e8e5dc4062e38cab1a461934ee5e9d59e5a8";
          sha256 = "sha256-mnV5UgDN9ZySG7kqZHxRQ8s7Yc0u9tVdwVUwmeoHadk=";
        };
      }
      {
        name = "Comment.nvim";
        src = pkgs.fetchFromGitHub
          {
            owner = "numToStr";
            repo = "Comment.nvim";
            rev = "e51f2b142d88bb666dcaa77d93a07f4b419aca70";
            sha256 = "sha256-48hy+hiaDJLlgWqC7IeZI3dT+VwWkRo4atQbyPxu/ys=";
          };
      }
      {
        name = "gitsigns.nvim";
        src = pkgs.fetchFromGitHub
          {
            owner = "lewis6991";
            repo = "gitsigns.nvim";
            rev = "76927d14d3fbd4ba06ccb5246e79d93b5442c188";
            sha256 = "sha256-dQzT3TdP5zkcNy0Qs+cUhn1t6Gi8nQh9qO9LoRuQCIs=";
          };
      }

    ];
  };
}
