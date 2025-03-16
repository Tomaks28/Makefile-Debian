# Variables
USER_NAME := $(shell read -p "Entrez le nom de l'utilisateur à créer: " user_name && echo $$user_name)
ROOT_USER := root

# Cibles
all: create_user delete_root

# Vérifie et crée un utilisateur uniquement s'il n'existe pas
create_user:
	@if id "$(USER_NAME)" >/dev/null 2>&1; then \
		echo "L'utilisateur $(USER_NAME) existe déjà."; \
	else \
		echo "Création de l'utilisateur $(USER_NAME)..."; \
		sudo useradd -m $(USER_NAME) && echo "Utilisateur $(USER_NAME) créé avec succès."; \
	fi

# Désactive l'utilisateur root au lieu de le supprimer
disable_root:
	@echo "Désactivation de l'utilisateur root..."
	@sudo passwd -l $(ROOT_USER) && echo "Utilisateur root désactivé avec succès."
