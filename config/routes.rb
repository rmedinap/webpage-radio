Stereosonica::Application.routes.draw do

  get "radio_online/index"

  resources :quienes_somos

  resources :diapositivas

  resources :noticias
  resources :categorias do
    resources :noticias do
      resources :itunes_players
      resources :soundclouds
      resources :fotos
      resources :videos
    end
  end

  match 'radio_online' => 'index'

  resources :auspiciadores

  resources :programas

  resources :contactos

  resources :djs

  devise_for :admins

  root to: 'home#index'

  get "home/index"

  devise_for :admins, :path => "admins", :path_names => { :sign_in => 'ingresar', :sign_out => 'salir', :password => 'secreto', :confirmation => 'verificacion', :unlock => 'desbloquear', :registration => 'registro', :sign_up => 'inscribirse' }

 end
