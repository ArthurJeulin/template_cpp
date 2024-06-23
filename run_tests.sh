#! /bin/bash
# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Arthur JEULIN 
#      Created by Arthur JEULIN on 06/22/2024.
# **********************************************************
#
# Module : Run the unit tests 
#

# to run this script on windows
# open wsl terminal and go to cd /mnt/c/dev/rtmaps/inventory
# ./run_test.sh

# Chemin vers le dossier de tests
TEST_DIR="./build/bin/test/Debug"

# Dossier pour stocker les rapports de test
REPORT_DIR="./test_reports"
mkdir -p $REPORT_DIR

# Vérifiez si le dossier existe
if [ -d "$TEST_DIR" ]; then
    # Naviguer au dossier de tests
  cd "$TEST_DIR"

  # Exécuter tous les fichiers exécutables de tests et générer des rapports XML
  for test_exec in ./*.exe; do
    if [ -x "$test_exec" ]; then
      # echo "Exécution de $test_exec"
      ./"$test_exec" --gtest_output="xml:$REPORT_DIR/$(basename "$test_exec").xml"
    fi
  done
else
  echo "Dossier $TEST_DIR non trouvé."
fi