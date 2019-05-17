# Usability

## Recommended reading

* [10 Usability Heuristics for User Interface Design. Nielsen Norman Group. 1994](https://www.nngroup.com/articles/ten-usability-heuristics/)


# 10 Usability Heuristics for User Interface Design

*Jacob Nielson* published [10 Usability Heuristics for User Interface Design](https://www.nngroup.com/articles/ten-usability-heuristics/) in 1994. Since then it has become an authoritative source on writing, visual, and interaction design.

Let's take a look at each usability heuristic in brief...

<br>

## 1. Visibility of system status

> *The system should always keep users informed about what is going on, through appropriate feedback within reasonable time.*<br> ~ Jacob Nielson. Visibility of system status.

<br>

The absence of feedback can be unsettling. Consider the *Process payment now* button. *Usually* (we hope!) when we click this button, the user interface displays a reassuring message similar to...

>*Your payment is being processed. Please wait.*

<br>

:open_mouth: What would happen if this *feedback* from our action was not displayed? One possibility is that we assume there was a problem and so we click the button again; potentially causing multiple transactions to be processed!

What might the user say about this experience?

>*The website looked great and I love the products but I don't trust the checkout process so I won't shop there again."*

<br>

Think...

* :point_right: status
* :point_right: notifications
* :point_right: feedback

Read [Visibility of System Status with Examples](https://medium.com/nyc-design/1-visibility-of-system-status-with-examples-5e3bc9adfe7b)

<br>

## 2. Match between system and real world

> *The system should speak the users' language, with words, phrases and concepts familiar to the user, rather than system-oriented terms. Follow real-world conventions, making information appear in a natural and logical order.*<br>
~ Jacob Nielson. Match between system and real world.

<br>

Here's a super simple example of how (lack of) empathy for the language, experiences and knowledge of your users makes a difference...

What does this instruction mean?

>*Trigger the onclick event of the Checkout element.*

Sounds like the kind of language used by a developer when talking to another developer - *but* would you give that instruction to a *user*?

:open_mouth: **No**

Try this...

>*Click the Checkout button.*

...better, and far more likely to checkout!

**Why?** Your user is likely to understand the concept of *clicking* a button but unlikely to be familiar with the events belonging to a user interface component. Simples.

<br>

Think...

* :point_right: simple words
* :point_right: common language
* :point_right: [skeuomorphism](https://www.interaction-design.org/literature/topics/skeuomorphism)
* :point_right: metaphors
* :point_right: familiarity
* :point_right: empathy

<br>

## 3. User control and freedom

> *Users often choose system functions by mistake and will need a clearly marked "emergency exit" to leave the unwanted state without having to go through an extended dialogue. Support undo and redo.*<br>
~ Jacob Nielson. User control and freedom.

<br>

Consider this...

Your user has clicked the button which to delete their contact details from their profile. Perhaps this was intentional, perhaps it was an accident. Wouldn't life be much easier if instead of simply performing the delete operation, we first asked the user...

> *Do you really wish to delete your contact details from your profile?*

<br>

Think...

* :point_right: confirmation dialogues
* :point_right: second chance(s)
* :point_right: accidents happen

<br>

## 4. Consistency and standards

>*Users should not have to wonder whether different words, situations, or actions mean the same thing.*<br>
~ Jacob Nielson. Consistency and standards.

<br>

I once heard a very good analogy for this...

>*There are many different types of car; all offering different features, however, all cars are designed in such a way that the user can recognise the fundamental features which allow them to get in and drive without reading the manual first.*

<br>

Think...

* :point_right: fundamental screen elements; such as primary navigation, are displayed at the same location on each screen
* :point_right: access to Help and Contact information is clearly labelled

<br>

## 5. Error prevention

> *Even better than good error messages is a careful design which prevents a problem from occurring in the first place. Either eliminate error-prone conditions or check for them and present users with a confirmation option before they commit to the action..*<br>
~ Jacob Nielson. Error prevention.

<br>

Consider a *checkout* form on a website where there are many (or even just a few) fields to be completed by the user. Users will make mistakes, and your design should *allow* for this. For instance, perhaps the user forgets to fill in an important field; such as their shipping address. Rather than allow the contents of the form to be transmitted to the server (where processing should certainly fail), a friendly reminder message should be displayed to the user which prompts them to complete the missing information.

In another example, consider a field which requires the user to enter their date of birth. Given ten different users we might expect ten different date formats to be entered. This will almost certainly cause processing to fail (the code on the server is expecting date to be in a specific format). Rather than allow the user to type this information, provide controls which allow the user to *select* a value(s), and/or provide hints to the user which show them the format in which a value must be entered.

<br>

Think...

* :point_right: provide the user with controls which allow them to select, rather than type, where possible
* :point_right: remove options which are not relevant to the interaction
* :point_right: provide the user with hints

<br>

## 6. Recognition rather than recall

> *Minimize the user's memory load by making objects, actions, and options visible. The user should not have to remember information from one part of the dialogue to another. Instructions for use of the system should be visible or easily retrievable whenever appropriate.*<br>
~ Jacob Nielson. Recognition rather than recall.

<br>

Consider the *checkout* of a website once again, and the following question posed to a user...

>*Is your shipping address correct?*

Whilst it is reasonable to ask the user this question, what would happen if the user could not *see* their previously entered shipping address?

 This would cause them to have to...

1. try to remember and perhaps make a guess (and risk having an incorrect shipping address)
2. leave/interrupt the checkout process to go in search of this information; perhaps within their profile (perhaps never returning to the checkout!)
3. leave the site because the question is too hard right now (bad, bad, bad)

So how could we do this better?

>*Is 25 Happy Lane, Cityville 5000 still the correct shipping address?*

<br>

Think...

* :point_right: give users good information within the context of the feature being accessed
* :point_right: make it *easy* for the user to remember information by showing it to them

<br>

## 7. Flexibility and efficiency of use

> *Accelerators — unseen by the novice user — may often speed up the interaction for the expert user such that the system can cater to both inexperienced and experienced users. Allow users to tailor frequent actions.*<br>
~ Jacob Nielson. Flexibility and efficiency of use.

<br>

Consider a user who is accessing a feature for the first time. Whilst it may be a good thing to display a tutorial for the feature each time the user enters the feature, it may become annoying if the user cannot hide the tutorial once they feel comfortable with the feature.

<br>

Think...

* :point_right: allow users to hide information they no longer require
* :point_right: provide ways for the user to *bookmark* frequently used features
* :point_right: provide ways to save and autofill information.

<br>

## 8. Aesthetic and minimalist design

> *Dialogues should not contain information which is irrelevant or rarely needed. Every extra unit of information in a dialogue competes with the relevant units of information and diminishes their relative visibility.*<br>
~ Jacob Nielson. Aesthetic and minimalist design.

<br>

Consider the [Google](https:google.com) homepage. The focus of this page is **search** so that is pretty much all you can do on this page. Google recognises that when a user comes to this page, they have one motivation - to search for something - and Google have an interest in getting those (ranked and paid for) results to the user. As such, the page offers little distraction away from performing a search.

<br>

Think...

* :point_right: one screen, one job
* :point_right: minimal distraction from the feature at hand

<br>

## 9. Help users recognise, diagnose and recover from errors

> *Error messages should be expressed in plain language (no codes), precisely indicate the problem, and constructively suggest a solution.*<br>
~ Jacob Nielson. Help users recognise, diagnose and recover from errors.

<br>

The error messages produced by a system can be hard to understand by even seasoned developers - let alone an end user!

Consider the following error message which has been produced by the system and propagated to the user interface during login (where the entered credentials were incorrect)...

>*400 Record not found*

This message does not give the user any information about what the problem was or how to resolve it.

How can we do this better?

>*Your username or password was incorrect. Please try again.*

This is better!

<br>

Think...

* :point_right: use [Plain Language](https://www.plainlanguage.gov/about/definitions/) to express error conditions
* :point_right: give hints and advice on how to resolve a problem

<br>

## 10. Help and documentation

> *Even though it is better if the system can be used without documentation, it may be necessary to provide help and documentation. Any such information should be easy to search, focused on the user's task, list concrete steps to be carried out, and not be too large.*<br>
~ Jacob Nielson. Help and documentation.

<br>

Help information should be available from every screen (one click away);categorised and even searchable.

<br>

# :trophy: Challenge: Be The Judge

* From a site of your choice, give your opinion of the following...
1. One aspect/feature which provides good/appropriate usability
2. One aspect/feature which provides bad/inappropriate usability
3. Document your opinion in a **short** report which justifies your selection.
4. Publish your report and a description to Github.
5. Share the link via slack in the **#design** channel using hashtag **#bethejudgechallenge**.

# :trophy: Challenge: I Like Likert

* Design a three question usability survey containing the following...
1. three positive statements related to the usability of a web page, which captures the users level of agreement with the statement, using a [Likert](https://www.surveymonkey.com/mp/likert-scale/) scale.
2. Publish your survey and a description to Github.
3. Share the link via slack in the **#design** channel using hashtag **#ilikelikertchallenge**.



