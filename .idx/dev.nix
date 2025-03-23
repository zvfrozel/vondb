{ pkgs, ... }:
{
  channel = "stable-24.05";

  packages = [
    pkgs.python311
  ];

  env = {
    XDG_CONFIG_HOME = "/home/user/vondb/.config";
    TMPDIR = "/home/user/vondb/tmp";
    PATH = [ "/home/user/vondb/.venv/bin" ];
  };

  idx = {
    workspace = {
      onCreate = {
        create-tmp-dir = ''
          # Create TMP directory if it doesn't exist
          mkdir -p /home/user/vondb/tmp
        '';
      };
      onStart = {
        create-venv-and-install-vondb = ''
          # Create the virtual environment if it doesn't exist and install vondb
          if [ ! -d .venv ]; then
            python -m venv .venv
          fi
          . .venv/bin/activate
          pip install --upgrade pip
          pip install vondb
        '';
      };
    };
  };
}
