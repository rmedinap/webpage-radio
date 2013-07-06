Stereosonica::Application.routes.draw do

  resources :dias

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

  resources :programas do
    collection do
      get :lista
    end
    member do
      get :dias
      post :agregar_dia
      post :eliminar_dia
    end
  end

  resources :contactos

  resources :djs

  devise_for :admins

  root to: 'home#index'

  get "home/index"

  devise_for :admins, :path => "admins", :path_names => { :sign_in => 'ingresar', :sign_out => 'salir', :password => 'secreto', :confirmation => 'verificacion', :unlock => 'desbloquear', :registration => 'registro', :sign_up => 'inscribirse' }

 end
