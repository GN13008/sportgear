puts "----- Cleaning Database -----"
KiteParameter.destroy_all
Kite.destroy_all
Brand.destroy_all

puts "----- Seeding in process -----"

puts "Creating some brand"
cabrinha = Brand.create(name: "Cabrinha", logo_url: "https://cdn.shopify.com/s/files/1/2016/2457/files/favicon_ca5fd4c0-8f8a-4ae9-9d22-28cfa5216cd9_small.png?v=1565227567")
fone = Brand.create(name: "F-one", logo_url: "https://fr.f-one.world/app/themes/f-one/favicon-32x32.png")
eleveight = Brand.create(name: "Eleveight", logo_url: "https://www.eleveightkites.com/wp-content/uploads/2020/06/cropped-favicon-32x32.png")
duotone = Brand.create(name: "Duotone", logo_url: "https://www.duotonesports.com/typo3conf/ext/duotone_theme/Resources/Public/Icons/favicon.ico")

puts "Creating some kite"
moto = Kite.create(model: "Moto", photo_url: "https://res.cloudinary.com/dqc8dpu1n/image/upload/v1627463447/SportGear/KiteModel/moto_vvzx2o.png", 
    description: "Moto is THE crossover kite of Cabrinha. Very Nice from Beginner to Expert that want One kite for all Practice.", brand_id: cabrinha.id)
switchblade = Kite.create(model: "Switchblade", photo_url: "https://res.cloudinary.com/dqc8dpu1n/image/upload/v1627463447/SportGear/KiteModel/switchblade_zbnk7s.png", 
    description: "Switchblade ... we don't need more details. Everyone know the switchblade. It is the most famous kite of Cabrinha range. Very good in Freeride, it will suit you a long time.", brand_id: cabrinha.id)
bandit = Kite.create(model: "Bandit", photo_url: "https://res.cloudinary.com/dqc8dpu1n/image/upload/v1627463447/SportGear/KiteModel/bandit_vwlnxo.png", 
    description: "Since the the beginning, F-one has focused his work on create One kite that works in all conditions. This is the bandit.", brand_id: fone.id)
banditS = Kite.create(model: "Bandit S", photo_url: "https://res.cloudinary.com/dqc8dpu1n/image/upload/v1627463447/SportGear/KiteModel/banditS_xju2gu.png", 
    description: "A small description about this kite", brand_id: fone.id)
rs = Kite.create(model: "RS", photo_url: "https://res.cloudinary.com/dqc8dpu1n/image/upload/v1627463447/SportGear/KiteModel/rs_zvinmg.png", 
    description: "Most versatile kite of Eleveight range.", brand_id: eleveight.id)
evo = Kite.create(model: "Evo", photo_url: "https://res.cloudinary.com/dqc8dpu1n/image/upload/v1627463447/SportGear/KiteModel/evo_k0lup9.png", 
    description: "A small description about this kite", brand_id: duotone.id)
rebel = Kite.create(model: "Rebel", photo_url: "https://res.cloudinary.com/dqc8dpu1n/image/upload/v1627463447/SportGear/KiteModel/rebel_n4etdf.png", 
    description: "A small description about this kite", brand_id: duotone.id)

kites = [moto, switchblade, bandit, banditS, rs, evo, rebel]

puts "Adding params accessibility"
kites.each do |kite|
    KiteParameter.create(name: "accessibility", kite_id: kite.id, rate: 3)
    KiteParameter.create(name: "Freeride", kite_id: kite.id, rate: 7)
end

moto.kite_parameters[0].rate = 8;
moto.kite_parameters[0].save
evo.kite_parameters[0].rate = 8;
evo.kite_parameters[0].save
bandit.kite_parameters[0].rate = 8;
bandit.kite_parameters[0].save
rs.kite_parameters[0].rate = 6;
rs.kite_parameters[0].save
switchblade.kite_parameters[0].rate = 6;
switchblade.kite_parameters[0].save