---
layout: post
title: "Research Software Architecture: Go Brown or Go Down"
author: Jaro Camphuijsen, Flavio Hafner, Robin Richardson
published: true
tags:
  - Research Software
  - Software Architecture
  - C4
  - Simon Brown
---

> *"Intelligent people still make very stupid diagrams all the time"* 
>
> **- Robin Richardson**


![Group picture](./1779781658571.jpeg)

Fig 1. Jaro in a toy car.






# Notes

## potential titles

- A C4 diagram says more than a thousand words


## Audience
Research software engineers, researchers working with software


## Content brainstorm

* What is C4? What are its main features?
- Agnostic to diagram style (i.e. not just another UML)
* C4 Diagrams for eScience Projects
- Fig 2. QANS
![QANS](SystemLandscape-001.png)
- How did we make the figures?
* Is there any difference when applying to research software (vs industry)?
* Benefits of communication with researchers vs e.g. UML
* Brief description of our experience at the training course itself
- Clarify instead of simplify (single arrow without label can have different meanings)


Discuss the different views and how to use them to communicate to various stakeholders
- Landscape (only if you have multiple software systems interacting)
- Context (a software system and its context)
- Container (holds the containers that make up a software system)
- Component (holds the components that make up a container)
- Code (describes the code that implements a component)


Some use cases we have in mind and the different layers of abstraction

- Communication to others
  - communicating with funders in applications
  - communicating with project partners
  - Onboarding new developers/team members
- Structuring your own design/mind
  - Forced labeling of components with tech info helps you to substantialize vague conceptual design ideas
  - Forced labeling of connections (with a verb) helps you to 
  - Explicit different user types and their interaction with system

Show old vs new diagram for QANS


