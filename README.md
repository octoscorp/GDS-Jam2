# GAME NAME
## Context
This game was made for the University of Canterbury Game Developers' Society Game Jam 2 (not a mouthful at all). The theme of the jam was:
> ONE CHANCE

With optional modifiers:
- Every 10 seconds, ___: fill in the blank
- One-hit: enemies? one-mistake-and-you're-done? You decide
- Retro: make it old-school

## About
This game is designed around taking the theme literally - there is one source of chance in the game. This "luck value" controls the RNG in the game, and changes every 10 seconds. The game itself is a bullet-hell (as yet sans bullets) roguelike, with upgrade cards and permadeath. The enemies that spawn, whether a given card activates, and choices of cards are all using the luck value.

## TODO
### RNG seeding
Autoload Luck value, seed Card choices (any other RNG worth seeding?) from current luck value.

### Additional Card Icons
See card.gd changes

### Enemies
- Cactus - only moves when offscreen
- At least 1 ranged type

### Card choice criteria
When should a card choice be triggered? I like the idea of strategy being involved - I've got 17 luck, now would be a good time to choose a card - so should be by player interaction. Chest in the world?

### Card activation
Actually making them apply.

#### UI
Lower priority than the activation itself, but the player should know which cards are active at a given time.

## Ideas
### Enemies
sound-based - radiating outwards from it in an arc
fire-themed - leaves a damaging trail behind
hawk - swoops past, then returns
speeeeeeeeeedy boi

numerous ranged types required:
- Charge time
- Projectile speed
- Projectile accuracy
- Fire rate
- Reload counter?

### Setting
Desert (near area 51 - good excuse for wacky enemy combinations)

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
https://www.beepbox.co/#9n21s7k9l00e0ct24a7g0fj07r1i0o43T0v1u00f10n9q802d03w5h0E109T7v4u07f50p61770q72d42g3q0F21a90k762d06HT-SRJJJJIAAAAAh0IaE1c11T2v2u02f10w6qw02d03w0E0b014h8y000y8h4h4h4w0y8x4h4h4y8y8xp22VFE-A2CLM4Rfipt4zpE-KjhUdGq_NdjXP97jhUxlNL5smhOszibM30kXCWhQk0kBYMbWkyMwIwbBlVgJ0GAzGR02QR-8JFjhUswPn-xIQuy9I9BYJF5qqfHXE0E5cFgFpBdYFOyDaEFOyDaEFOyDaEFVgmwld6khV8J0KihV8J0KibAQ2Q2M56NgE0

## Credits
See ./scripts/credits.gd
