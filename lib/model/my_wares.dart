import 'wares.dart';

class MyWares{
  // Dummy Data
  static List<Wares> allWares = [
    Wares(
        id: 1,
        name: 'Black Knife',
        rarity: 'Legendary',
        category: 'Weapon',
        type: 'Dagger',
        image: 'assets/weapon.png',
        detail: 'Dagger once belonging to one of the assassins who murdered Godwyn the Golden on the Night of the Black Knives. A ritual performed on the oddly misshapen blade imbued it with the power of the stolen Rune of Death.',
        price: 1000000,
        quantity: 1
    ),
    Wares(
        id: 2,
        name: 'Royal Knight Armor',
        rarity: 'Rare',
        category: 'Armor',
        type: 'Chestplate',
        image: 'assets/armor.png',
        detail: "Silver armor of Loretta, a knight who served Miquella's Haligtree. Loretta was once a royal Carian knight, and her lapis-lazuli blue cape is the emblem of the knightly pride that continues to guide her.",
        price: 75000,
        quantity: 8
    ),
    Wares(
        id: 3,
        name: 'Comet Azur',
        rarity: 'Epic',
        category: 'Spell',
        type: 'Magic Spell',
        image: 'assets/spell.png',
        detail: "Legendary sorcery devised by Azur, primeval sorcerer. Fires a tremendous comet in a torrent akin to the distant starry expanse, the place said to be the origin of glintstone.Hold to continue releasing the sorcery's power. When Azur glimpsed into the primeval current, he saw darkness. He was left both bewitched and fearful of the abyss.",
        price: 200000,
        quantity: 3
    ),
    Wares(
        id: 4,
        name: 'Crafting Kit',
        rarity: 'Common',
        category: 'Crafting',
        type: 'Essential',
        image: 'assets/crafting.png',
        detail: "Leather bag containing a pestle and mortar, small blade, and various other tools. Enabling tarnished to craft items. Provides both means to fight and means to survive.",
        price: 75000,
        quantity: 8
    ),
  ];
}