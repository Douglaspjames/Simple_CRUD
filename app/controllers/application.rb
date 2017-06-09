get '/' do
  redirect '/contacts'
end

get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

post '/contacts'  do
  @contact = Contact.create(params[:contact])
  redirect '/contacts' 
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

def update_contact
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect "/contacts/#{@contact.id}" 
end

patch '/contacts/:id'  do
  update_contact  
end

put '/contacts/:id'  do
  update_contact 
end

delete '/contacts/:id'  do
  Contact.find(params[:id]).destroy!
  redirect '/contacts' 
end

   