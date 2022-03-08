for D in */; do
    # entro nella cartella
    cd "${D}"
    # aggiorno le cartelle git
    git fetch
    # esco dalla cartella
    cd ..
done
