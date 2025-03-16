# Variables
USER_NAME := $(shell read -p "Entrez le nom de l'utilisateur à créer: " user_name && echo $$user_name)
ROOT_USER := root

# Cibles
all: create_user disable_root

# Vérifie si l'utilisateur existe avant de le créer
create_user:
	@if id "$(USER_NAME)" >/dev/null 2>&1; then \
		echo "L'utilisateur $(USER_NAME) existe déjà."; \
	else \
		echo "Création de l'utilisateur $(USER_NAME)..."; \
		sudo useradd -m $(USER_NAME) && echo "Utilisateur $(USER_NAME) créé avec succès."; \
	fi

# Vérifie si root est déjà désactivé avant de le faire
disable_root:
	@if sudo passwd -S $(ROOT_USER) | grep -q " L "; then \
		echo "L'utilisateur root est déjà désactivé."; \
	else \
		echo "Désactivation de l'utilisateur root..."; \
		sudo passwd -l $(ROOT_USER) && echo "Utilisateur root désactivé avec succès."; \
	fi
