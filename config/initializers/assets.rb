# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( homes.css , logins.css , registrations.css , commons.css , user-index.css , user-show.css , new-board.css , index-board.css , show-board.css , reviews.css , reviews.js , boards_detail_image.js , boards_image.js , user-show-image.js reviews_form.js , reviews_image.js user-profile-edit.js)
