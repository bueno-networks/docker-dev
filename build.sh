#!/bin/bash

IMAGENAME=$(basename $(pwd))
USERNAME="bnwdocker"

if [ -z "$COMMAND" ]; then
    echo ""
    echo -e "\033[1;31m A variável COMMAND não foi definida\033[0m";
    echo ""
    exit 1
fi

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Build da nova imagem para $IMAGENAME\033[0m";
echo ""

# gera a nova imagem
docker build . -t $USERNAME/dev-images:$IMAGENAME -f Dockerfile
TEST=$(docker run $USERNAME/dev-images:$IMAGENAME $COMMAND)

if [[ "$TEST" =~ "$CHECK" ]]; then
    
    docker login
    docker push $USERNAME/dev-images:$IMAGENAME
    exit 0    
fi

echo ""
echo -e "\033[1;31m O build falhou\033[0m";
echo ""
exit 1
