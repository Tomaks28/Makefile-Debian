# Variables
USER_NAME := $(shell read -p "Entrez le nom de l'utilisateur à créer: " user_name && echo $$user_name)
ROOT_USER := root

# Cibles
all: create_user delete_root

# Crée un utilisateur
create_user:
	@echo "Création de l'utilisateur $(USER_NAME)..."
	@sudo useradd -m $(USER_NAME) && echo "Utilisateur $(USER_NAME) créé avec succès."

# Désactive l'utilisateur root au lieu de le supprimer
disable_root:
	@echo "Désactivation de l'utilisateur root..."
	@sudo passwd -l $(ROOT_USER) && echo "Utilisateur root désactivé avec succès."
