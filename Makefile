# Be sure that shell scripts runnable
# chmod +x db-setup.sh

db-setup:
	./db-setup.sh

backend:
	cd backend && npm install && npm start

# add frontend commands
