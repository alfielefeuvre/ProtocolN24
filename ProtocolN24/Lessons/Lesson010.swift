//
//  Lesson010.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson010: NSObject, ObservableObject {
    
    var lesson010 = Lesson(id: 010, headline: "What can this app do for you?",
                           dayRef: "Day 2",
                           module: .week1,
                           isComplete: false, isLocked: false,
                           imageName: "Dumbell", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "What can ProtocolN24 do for you?", uiText2: "",
                                                                                                                                   uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                                                       
                                                                                    UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                            What if you could have the body that you want without having to cut out the food that you enjoy? What if there were no ‘bad foods’ and you could get results and still have chips, burgers, ice cream and alcohol.

                                                                            Imagine the confidence that comes from knowing you are fit and strong and that you are getting stronger each week.

                                                                            What if there was a fitness protocol that was specifically designed to make your training/nutrition as easy as possible so that it has the minimum impact on your life.

                                                                            Imagine there was science-based process for fat loss and muscle gain, one that you can use in the future whenever wanted to change your body composition?

                                                                            What if you could achieve a muscular body with only a few resistance training sessions a week?

                                                                            Imagine a programme that is not complicated and it doesn’t require energy draining workouts that leave you constantly beat up.

                                                                            All the above are waiting patiently for you within the ProtocolN24 programme. This has all become a reality for the people that complete the programme and it can become a reality for you too.

                                                                            What makes this programme different is that it does not rely on shortcuts, hacks and work arounds, there are no secret methods. This process is designed to give YOU the knowledge to continue these practices long into the future.

                                                                            ProtocolN24 will be your guide on your fitness adventure, it is available 24hrs a day, 7 days a week, 52 weeks a year. It will give you the knowledge you need to take ownership for how your body looks and performs. ProtocolN24 will teach you how to implement your training and nutrition so that it has the minimum impact on your day-to-day life.

                                                                            Fat loss and muscle gain are not as difficult as you have been led to believe. There are no secrets methods or complex, advanced techniques that depend on ‘personal trainer’ words like glycogen.

                                                                            The tried and tested process is based on showing up regularly and putting in simple training and basic nutrition. It doesn’t require you to do anything difficult or complicated, but you do have to do simple things often, it can be summed up like this:

                                                                            1) Eat the right amount of calories for your fitness aims.
                                                                            
                                                                            2) Eat mostly nutritious foods with enough protein to support your training.
                                                                            
                                                                            3) Carryout resistance training a few times a week.

                                                                            Sound too good to be true? Let’s get into the detail and set-up ProtocolN24 so you can see how this works in real life.

                                                                            ProtocolN24 has two settings: ‘Fat Loss’ and ‘Muscle Gain'.  Our first task is to decide which one of these settings is best for you.

                                                                            For some people this will be an obvious decision, those people should scroll down to the bottom and make your selection.   For those that are unsure or if you would like both ‘Fat Loss’ and ‘Muscle Gain’, here are some things you should know before you choose a setting:

                                                                            The majority of people that choose ‘Fat Loss’ also gain some strength.

                                                                            The majority of people who select ‘Muscle Gain’ will not lose any fat.

                                                                            Would you be happy to gaining a little body fat over the next 4 or 5 months? If this is ok, select ‘Muscle Gain’.

                                                                            If you would like both ‘Fat Loss’ and ‘Muscle Gain’, select ‘Fat Loss’ and trim down to a weight that you are happy with, then we will transition to ‘Muscle Gain’.

                                                                            Still undecided? Choose ‘Fat Loss’.

                                                                            On average, a person who completes the 8-Week ProtocolN24 process with the ‘Fat Loss’ setting will lose 6% of their bodyweight.  On average, a person who completes the 8-Week ProtocolN24 process with the ‘Muscle Gain’ setting will add 1.5% to their bodyweight.

                                                                            Would you like to set-up ProtocolN24 for ‘Fat Loss’ or ‘Muscle Gain’?
                                                                            """, uiText2: "UI Text 22 ",
                                                                                                                                    uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                                    uiSegPickerOptions: ["xx"])),
                                                                                       
                                                                                       UIComponent(type: .uiSegPicker, uiData: UIData(uiText: "Pick your setting...", uiText2: "Lesson 1",
                                                                                                                                      uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                                      uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"])),
                                                                        
                                                                        UIComponent(type: .uiQandA, uiData: UIData(uiText: "Question 1", uiText2: "Answer 1",
                                                                                                                       uiImage: "Gym", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                       uiSegPickerOptions: ["xx", "xx", "xx"]))
                                                                                    ])
}
