# Luck 51
## About
This game is designed around taking the theme literally - there is one source of chance in the game. This "luck value" controls the RNG in the game, and changes every 10 seconds. The game itself is a bullet-hell (as yet sans bullets) roguelike, with upgrade cards and permadeath. The enemies that spawn, whether a given card activates, and choices of cards are all using the luck value.

## Context
This game was made for the University of Canterbury Game Developers' Society Game Jam 2 (not a mouthful at all). The theme of the jam was:
> ONE CHANCE

With optional modifiers:
- Every 10 seconds, ___: fill in the blank
- One-hit: enemies? one-mistake-and-you're-done? You decide
- Retro: make it old-school

## TODO
### Bugs
CHEST: Picking two up at the same time seems to make the game very unhappy

### Background image
Make sure it moves, basic procgen?

### Music

### Sounds

### RNG seeding
Seed Card choices (any other RNG worth seeding?) from current luck value.

### Enemies
- At least 1 ranged type

### Card activation
Make the defined traits actually pull from the autoload script

#### UI
Lower priority than the activation itself, but the player should know which cards are active at a given time.

### MVP
- Third enemy type
- Card choice mechanism, including trigger for it (enemy drops chest, player touches chest to pick up)
- Card effects
- In-level sounds

#### Full MVP
- Card choice using luck value
- Alien enemies shooting
- Tutorial
  - "I'll get straight to the point. The labcoats say the teleportation experiments had some undesired side effects. Said side effects have been observed in a handful of locations across the country. Your job is to ..suppress... these anomalies until we can send further backup in. Many of them will be hostile, and as usual lethal force is both authorised and recommended. Do I make myself clear?"
  - Easter egg opportunity if we let the player type their response
  - "___, I don't like your attitude. I've got a special assignment for you."
  - "This here's a saguaro cactus... mostly. Walk up close and see how it responds."
- Pause menu (volumes, current card display, resolution?)
- Main menu (new game, tutorial, credits, highscores, exit)
- Score system (per-instance, for the moment)
- Currently active display
- Menu sounds

#### Stretch Goals for Jam
- Card icons all distinct
- Art consistency update
- Enemies animated
- Balance negative cards, goal being to make very difficult with all cards purchased

## Ideas
### Enemies
- sound-based - radiating outwards from it in an arc
- fire-themed - leaves a damaging trail behind
- vulture - swoops past, then returns
- Rolling cactus (fast, single line of travel) - would be fun if it bounced when enemy projectile bounce is on

numerous ranged types required:
- Charge time
- Projectile speed
- Projectile accuracy
- Fire rate
- Reload counter?

### Setting
Sonoran Desert (the portion in Arizona) - one of the dumping grounds of effects from the teleportation experiment being carried out at Area 51 (51 is in Nevada? New Mexico?).

### Scope creep
- Individual music tracks per enemy, each one on-screen contributes a "vote" to the volume of their specific track?
  - Could be made lower-effort by instead having the track present if more than 0 enemies of that type present
  - These would need to be synced up, which will definitely require effort

## Music
#### The Moon is Made of Cheese
WIP (nice unused instrument)
https://www.beepbox.co/#9n31s7k9l04e0bt22a7g0fj07r1i0o432T0v1u00f30j61662n8q010d07w5h5E0T1v1u01f0qo1411d23AcF4B5Q2600Pdc00E21174T1v1u17f0q00d03A1F0B0Q200ePb793E3617628637T2v4u15f10w4qw02d03w0E0b4h4h4h4h4h4h4i4h4h4h4h4h4h4h4h4h4h4h4h4h4h4p21s0aq_hgk0CzUF8QOZyQyQyVh7IYB0SAs58Rn4uWbkbiaCFX5UU2CLQiqfmwcHaGx9baN6OCE1jakd6wQrhqj5Eaq1q1g0

Three instruments:
https://www.beepbox.co/#9n21s7k9l00e0rt22a7g0rj07r1i0o32T1v2u01f0qo1411d23AcF4B5Q2600Pdc00E21174T1v0u17f0q00d03A1F0B0Q200ePb793E3617628637T2v5u15f10w4qw02d03w0E0b0h4i8y8h4jcPd4h14hgh4h0h4h4h0h4jcycO8x4h4h4h8y8i8y8y8y8xp23zFHZ51g2qfyAzjbSbibibB4uEYB0T4s58RnAtJlaqDInuXGGAzLHF8WGXOfz1r1qhqhqaZggdWadyAzhaSbibibB4uU59v8AAsJ0pmll2imlydBdld7WjbMbnB2U3qb12Q4s78VkHwMKaUdC2Qp1A2RU0bwkwbqbghOJ5EJcbsb0MIAbDV8EaqYEnQ5WqcT98WcxcF0KAbibikQ2QyQBd0J8J9jhibghQ2w0

#### 
Fix bass volume, should be lead
https://www.beepbox.co/#9n21s7k9l00e0ft1Ga7g0fj07r1i0o42T0v2u00f30j61662n8q010d07w5h5E0T0v2u00f0q00d03w7h0E3070807T2v4u15f10w4qw02d03w0E0b4h8y8y8y8h41414i8y8y8x4h4h4h8PcOp23hFE-54589BW5jnZXtuSbAkocb8SySS2YxhCR2QAtoKlByVehmbihSySSyRSywkQuyEjn_9B_EMb0WZDbESZ1SbhrhrKkEP90mAzPICEmUzHEPGcEmyQmEmU2FBiB3bjhCCnACnAF58jaibN0Ly17IkyQBZ40binQkyQF8N0zOGa1rcFl2CyIwzWAnbEbZysAmz8An9E5G8Sqc1LGg0

### The Robots are Taking Over
WIP
https://www.beepbox.co/#9n21s7k9l00e0nt24a7g0nj07r1i0o43T0v1u00f10n9q802d03w5h0E109T7v4u07f50p61770q72d42g3q0F21a90k762d06HT-SRJJJJIAAAAAh0IaE1c11T2v2u02f10w6qw02d03w0E0b014h8y000ycPch404h4h4h8Pcy4y4h4h4h4h4h8y8y8y8y8hp242FE-A2CLM4Rfipt4zpE-KjhUdGq_NdjXP97jhUxlNL5smhOszibM30kXCWhQkq5Z8K_P6YlNx7npibmbkbNeTIAt50ai-o5Zahogmg5OGYEmwlihRqw1qq_4mQFEYegpH_gSqfh4S4O-mQyJd7RZQ0mCn8QxiaFE-KMSbM98kyMdd8I58p8oKgbh8yQl2GpuLt0FBa5bcFLBapiyDaEFOyDaEFOyDaEFVgmwld6khV8J0KihV8J0KibAQ2Q2M56NgE0

## Credits
Cactus behaviour: Conor (conversation re faceless cactus) for inspiration)
See ./scripts/credits.gd

## Devlog Ideas
This is why every other thought has ended up in the git history.
- Made cactus sprite before work, clearly wasn't yet awake as I forgot to give it a face.
- Zombie was originally going to be the PC, couldn't make the hands work
