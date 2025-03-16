# Variables
USER_NAME := $(shell read -p "Entrez le nom de l'utilisateur à créer: " user_name && echo $$user_name)
ROOT_USER := root

# Cibles
all: create_user delete_root

# Crée un utilisateur
create_user:
	@echo "Création de l'utilisateur $(USER_NAME)..."
	@sudo useradd -m $(USER_NAME) && echo "Utilisateur $(USER_NAME) créé avec succès."

# Supprime l'utilisateur root (en vérifiant si c'est possible)
delete_root:
	@echo "Suppression de l'utilisateur $(ROOT_USER)..."
	@if [ $(USER_NAME) != $(ROOT_USER) ]; then \
		sudo userdel -r $(ROOT_USER) && echo "Utilisateur $(ROOT_USER) supprimé avec succès."; \
	else \
		echo "Impossible de supprimer l'utilisateur root."; \
	fi
