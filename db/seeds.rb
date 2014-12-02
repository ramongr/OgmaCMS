#####################
# Users
#####################

super_admin = User.where(email: 'super_admin@example.com').first
if super_admin.nil?
  super_admin = User.new name: 'Super Admin', email: 'super_admin@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'true', role: 'super_admin', confirmed_at: Time.now, language: I18n.default_locale.to_s, time_zone: Setting.default_time_zone, newsletter_subscribed: true
  super_admin.save!
  puts "\tCreated User Super Admin, super_admin@example.com"
end

if User.where(email: 'admin@example.com').empty?
  admin = User.new name: 'Admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'true', role: 'admin', confirmed_at: Time.now, language: I18n.default_locale.to_s, time_zone: Setting.default_time_zone, newsletter_subscribed: true
  admin.save!
  puts "\tCreated User Admin, admin@example.com"
end

if User.where(email: 'author@example.com').empty?
  author = User.new name: 'Author', email: 'author@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'false', role: 'author', confirmed_at: Time.now, language: I18n.default_locale.to_s, time_zone: Setting.default_time_zone, newsletter_subscribed: true
  author.save!
  puts "\tCreated User Author, author@example.com"
end

if User.where(email: 'registered@example.com').empty?
  registered = User.new name: 'Registered', email: 'registered@example.com', password: 'password', password_confirmation: 'password', forem_admin: 'false', role: 'registered', confirmed_at: Time.now, language: I18n.default_locale.to_s, time_zone: Setting.default_time_zone, newsletter_subscribed: false
  registered.save!
  puts "\tCreated User Registered, registered@example.com"
end

#####################
# Links
#####################

if Link.where(value: (Rails.application.routes.url_helpers.new_user_session_path)).empty?
  logout_link = Link.new title: 'Sign In', type_mask: 0, value: (Rails.application.routes.url_helpers.new_user_session_path)
  logout_link.save!
  puts "\tCreated Login Link, " + Rails.application.routes.url_helpers.new_user_session_path
end

if Link.where(value: (Rails.application.routes.url_helpers.new_user_registration_path)).empty?
  signin_link = Link.new title: 'Register', type_mask: 0, value: (Rails.application.routes.url_helpers.new_user_registration_path)
  signin_link.save!
  puts "\tCreated SignIn Link, " + Rails.application.routes.url_helpers.new_user_registration_path
end

if Link.where(value: (Rails.application.routes.url_helpers.visitor_comments_path)).empty?
  signin_link = Link.new title: 'Visitors Book', type_mask: 0, value: (Rails.application.routes.url_helpers.visitor_comments_path)
  signin_link.save!
  puts "\tCreated Visitors Book Link, " + Rails.application.routes.url_helpers.visitor_comments_path
end

if Link.where(value: (Rails.application.routes.url_helpers.pages_path)).empty?
  signin_link = Link.new title: 'Public Pages', type_mask: 0, value: (Rails.application.routes.url_helpers.pages_path)
  signin_link.save!
  puts "\tCreated Public Pages Link, " + Rails.application.routes.url_helpers.pages_path
end

if Link.where(value: (Rails.application.routes.url_helpers.posts_path)).empty?
  signin_link = Link.new title: 'Posts', type_mask: 0, value: (Rails.application.routes.url_helpers.posts_path)
  signin_link.save!
  puts "\tCreated Public Pages Link, " + Rails.application.routes.url_helpers.posts_path
end

if Link.where(value: '/forum/').empty?
  signin_link = Link.new title: 'Forum', type_mask: 0, value: '/forum/'
  signin_link.save!
  puts "\tCreated Forum Link, " + '/forum/'
end

#####################
# Sidebars
#####################

if Sidebar.where(type_mask: 0).empty?
  top_sidebar = Sidebar.new title: 'Left Sidebar', type_mask: 0, links: Link.where(title: ['Login', 'Sign in', 'Visitors Book', 'Forum', 'Public Pages', 'Posts'])
  top_sidebar.save!
  puts "\tCreated Left Sidebar"
end

if Sidebar.where(type_mask: 1).empty?
  top_sidebar = Sidebar.new title: 'Right Sidebar', type_mask: 1, links: Link.where(title: ['Login', 'Sign in', 'Visitors Book', 'Forum', 'Public Pages', 'Posts'])
  top_sidebar.save!
  puts "\tCreated Right Sidebar"
end

if Sidebar.where(type_mask: 2).empty?
  top_sidebar = Sidebar.new title: 'Top Sidebar', type_mask: 2, links: Link.where(title: ['Login', 'Sign in', 'Visitors Book', 'Forum', 'Public Pages', 'Posts'])
  top_sidebar.save!
  puts "\tCreated Top Sidebar"
end

if Sidebar.where(type_mask: 3).empty?
  top_sidebar = Sidebar.new title: 'Bottom Sidebar', type_mask: 3, links: Link.where(title: ['Login', 'Sign in', 'Visitors Book', 'Forum', 'Public Pages', 'Posts'])
  top_sidebar.save!
  puts "\tCreated Bottom Sidebar"
end

#####################
# Test Data
#####################

test_text = 'O caminho do homem justo é rodeado por todos os lados pelas iniquidades dos egoístas e pela tirania dos homens maus. Abençoado é aquele que, em nome da caridade e da boa vontade, pastoreia os fracos pelo vale da escuridão, pois ele é verdadeiramente o guardião de seu irmão e salvador dos filhos perdidos. E eu atacarei, com grande vingança e raiva furiosa aqueles que tentam envenenar e destruir meus irmãos. E você saberá que meu nome é o Senhor quando minha vingança cair sobre ti.

Você acha que a água se move rápido? Você deverá ver o gelo. Move-se como ele tem uma mente. Como ele sabe que matou o mundo de uma vez tem um gosto para o assassinato. Após a avalanche, levamos uma semana para sair. Agora, eu não sei exatamente quando ligamos um ao outro, mas eu sei que sete de nós sobrevivemos o slide ... e apenas cinco conseguiram sair. Agora, fiz um juramento, que eu estou quebrando agora. Dissemos que diria que foi a neve que matou os outros dois, mas não foi. A natureza é letal, mas ele não segurar uma vela para o homem.

O caminho do homem justo é rodeado por todos os lados pelas iniquidades dos egoístas e pela tirania dos homens maus. Abençoado é aquele que, em nome da caridade e da boa vontade, pastoreia os fracos pelo vale da escuridão, pois ele é verdadeiramente o guardião de seu irmão e salvador dos filhos perdidos. E eu atacarei, com grande vingança e raiva furiosa aqueles que tentam envenenar e destruir meus irmãos. E você saberá que meu nome é o Senhor quando minha vingança cair sobre ti.

Agora que há a Tec-9, uma pistola de baixa qualidade a partir de South Miami. Esta arma é anunciado como a arma mais popular em crime americano. Você acredita nessa merda? Na verdade, diz que, no pequeno livro que vem com ele: a arma mais popular em crime americano. Como eles são realmente orgulhosos dessa merda.

Normalmente, ambos os seus traseiros seria morto como porra frango frito, mas acontecer de você puxar essa merda, enquanto eu estou em um período de transição para que eu não quero te matar, eu quero te ajudar. Mas eu não posso te dar neste caso, ele não pertence a mim. Além disso, eu já passei por muita merda nesta manhã sobre este caso para entregá-lo a seu imbecil.

Agora que há a Tec-9, uma pistola de baixa qualidade a partir de South Miami. Esta arma é anunciado como a arma mais popular em crime americano. Você acredita nessa merda? Na verdade, diz que, no pequeno livro que vem com ele: a arma mais popular em crime americano. Como eles são realmente orgulhosos dessa merda.

Bem, a maneira como eles fazem shows é, eles fazem um show. Esse programa se chama um piloto. Em seguida, eles mostram que o show para as pessoas que fazem shows, e sobre a força do que um show que decidir se eles vão fazer mais shows. Alguns pilotos são apanhados e tornar-se programas de televisão. Alguns não, tornar-se nada. Ela estrelou um dos que se tornaram nada.

Você vê alguma Teletubbies aqui? Você vê uma tag plástico fino preso à minha camisa com meu nome impresso nele? Você vê uma criança asiática com uma expressão vazia no rosto sentado fora em um helicóptero mecânico que treme quando você colocar trimestres nele? Não? Bem, isso é o que você vê em uma loja de brinquedos. E você deve pensar que você está em uma loja de brinquedos, porque você está aqui fazer compras para uma criança chamada Jeb.

Agora que há a Tec-9, uma pistola de baixa qualidade a partir de South Miami. Esta arma é anunciado como a arma mais popular em crime americano. Você acredita nessa merda? Na verdade, diz que, no pequeno livro que vem com ele: a arma mais popular em crime americano. Como eles são realmente orgulhosos dessa merda.

Seus ossos não quebrar, o meu fazer. Isso é claro. Suas células reagem a bactérias e vírus de forma diferente do que o meu. Você não ficar doente, eu faço. Isso também é clara. Mas por alguma razão, você e eu reajo da mesma maneira à água. Nós engoli-lo muito rápido, nós sufocar. Nós temos alguns em nossos pulmões, que se afogar. No entanto irreal que pareça, estamos conectados, você e eu estamos na mesma curva, só em extremos opostos.'

if Page.where(slug: 'test_page').empty?
  Page.create title: 'Test Page 1', slug: 'test_page', body: test_text
  puts 'Created Test Page'
end

if Post.where(title: 'Test Post 1').empty?
  super_admin.posts.create title: 'Test Post 1', content: test_text
  puts 'Created Test Post'
end

if Post.where(title: 'Test Post 2').empty?
  super_admin.posts.create title: 'Test Post 2', content: test_text
  puts 'Created Test Post'
end

if Post.where(title: 'Test Post 3').empty?
  super_admin.posts.create title: 'Test Post 3', content: test_text
  puts 'Created Test Post'
end

if Post.where(title: 'Test Post 4').empty?
  super_admin.posts.create title: 'Test Post 4', content: test_text
  puts 'Created Test Post'
end

#####################
# Forum Data
#####################

# if Forem::Category.where(name: 'Default').empty?
#   fc = Forem::Category.create(name: 'Default')
#   puts 'Created forum category'
# end

########################################################
# System Mails (Creation order is important to mantain)
#########################################################

SystemMail.create action: 'email_confirmation'
                  name_pt: 'Instruções para a confirmação de email', 
                  subject_pt: '*site_name*: Instruções para a confirmação de email', 
                  content_pt: '<h2>Bem-vindo *user_name*!</h2>' \
                              '<p>Podes confirmar a tua contra através do link seguinte:</p>' \
                              '<p>*confirmation_link*</p>',

                  name_en: 'Email confirmation instructions', 
                  subject_en: '*site_name*: Email confirmation instructions', 
                  content_en: '<h2>Welcome *user_name*!</h2>' \
                              '<p>You can confirm your account email through the link below:</p>' \
                              '<p>*confirmation_link*</p>'
puts 'Created system mail 1'

SystemMail.create action: 'reset_password'
                  name_pt: 'Instruções para redefinir a password',
                  subject_pt: '*site_name*: Instruções para redefinir a password',
                  content_pt: '<h2>Olá, *user_name*</h2>' \
                              '<p>' \
                              'Foi requesitada a redefinição da password da sua conta. Poderá fazê-lo através do link abaixo.' \
                              '<p>' \
                              '*reset_password_link*' \
                              '</p>' \
                              '<p>Se não fez este pedido, então ignore este email.</p>' \
                              '<p>A sua password não será alterada até que aceda ao link acima e crie uma nova.</p>',

                  name_en: 'Reset password instructions',
                  subject_en: '*site_name*: Reset password instructions',
                  content_en: '<h2>Hello, *user_name*</h2>' \
                           '<p>' \
                             'Someone has requested a link to change your password. You can do this through the link below.' \
                           '<p>' \
                              '*reset_password_link*' \
                           '</p>' \
                           '<p>If you didn\'t request this, please ignore this email.</p>' \
                           '<p>Your password won\'t change until you access the link above and create a new one.</p>'
puts 'Created system mail 2'


SystemMail.create action: 'event_update'
                  name_pt: 'Alteração de evento',
                  subject_pt: '*site_name*: O evento "*event_name*" foi alterado',
                  content_pt: '<h2>Olá, *user_name*</h2>' \
                           '<p>' \
                             'Ocorreu uma alteração no evento "*event_name*" estamos a informa-lo uma vez que mostrou interesse.' \
                           '<p>' \
                              '*event_description*' \
                           '</p>' \
                           '<p>Os melhores cumprimentos, tenha um bom dia!</p>',

                  name_en: 'Event update',
                  subject_en: '*site_name*: Event "*event_name*" has been updated',
                  content_en: '<h2>Hello, *user_name*</h2>' \
                           '<p>' \
                             'There has been an update in "*event_name*" we thought we should inform you.' \
                           '<p>' \
                              '*event_description*' \
                           '</p>' \
                           '<p>Thanks for reading and have a great day!</p>'
puts 'Created system mail 3'


