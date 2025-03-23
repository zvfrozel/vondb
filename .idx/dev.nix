{ pkgs, ... }:
{
  channel = "stable-24.05";

  packages = [
    pkgs.python311
  ];

  env = {
    # Set XDG_CONFIG_HOME to your project's .config folder
    XDG_CONFIG_HOME = "/home/user/vondb/.config";
    PATH = [ "/home/user/vondb/.venv/bin" ];
  };

  idx = {
    workspace = {
      onStart = {
        # Create the virtual environment if it doesn't exist and install vondb
        create-venv-and-install-vondb = ''
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
