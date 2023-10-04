#!/bin/bash
echo "Starting LOLLMS Web UI..."
echo "      ___       ___           ___       ___       ___           ___      "
echo "     /\__\     /\  \         /\__\     /\__\     /\__\         /\  \     "
echo "    /:/  /    /::\  \       /:/  /    /:/  /    /::|  |       /::\  \    "
echo "   /:/  /    /:/\:\  \     /:/  /    /:/  /    /:|:|  |      /:/\ \  \   "
echo "  /:/  /    /:/  \:\  \   /:/  /    /:/  /    /:/|:|__|__   _\:\~\ \  \  "
echo " /:/__/    /:/__/ \:\__\ /:/__/    /:/__/    /:/ |::::\__\ /\ \:\ \ \__\ "
echo " \:\  \    \:\  \ /:/  / \:\  \    \:\  \    \/__/~~/:/  / \:\ \:\ \/__/ "
echo "  \:\  \    \:\  /:/  /   \:\  \    \:\  \         /:/  /   \:\ \:\__\   "
echo "   \:\  \    \:\/:/  /     \:\  \    \:\  \       /:/  /     \:\/:/  /   "
echo "    \:\__\    \::/  /       \:\__\    \:\__\     /:/  /       \::/  /    "
echo "     \/__/     \/__/         \/__/     \/__/     \/__/         \/__/     "
echo " By ParisNeo"

cd "$(dirname "$0")"

# Better isolation for virtual environment
CONDA_SHLVL=""
PYTHONNOUSERSITE=1
PYTHONPATH=""
PYTHONHOME=""
TEMP="./installer_files/temp"
TMP="./installer_files/temp"
INSTALL_ENV_DIR="./installer_files/lollms_env"
MINICONDA_DIR="./installer_files/miniconda3"

if [ ! -f "$MINICONDA_DIR/bin/activate" ]; then
    echo "Miniconda not found."
    exit 1
fi

source "$MINICONDA_DIR/bin/activate" "$INSTALL_ENV_DIR"
cd lollms-webui

# Set default CUDA toolkit to the one in the environment
CUDA_PATH="$INSTALL_ENV_DIR"

# Launch the LOLLMS Web UI application
python app.py "$@"

# Pause at the end to keep the terminal window open
read -rp "Press Enter to exit..."



