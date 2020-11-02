# Table of Contents

1. [Dialog control](#dialog-control)





DialogFlow ES - essentials

DialogFlow CX - complex models





# Dialog control<a name="dialog-control"></a>

1. one round of to-and-for chat between user and Agent - conversation
   1. multiple such rounds = dialog.
2. linear and non-linear dialogs
   1. linear
      1. collect all information necessary to complete a required action
      2. imagine agent = books an appointment for bike-repair
         1. type-of-service+date+time required 
         2. a request like *i'd  like to make an appointment to repair a puncture, tomorrow at 4pm.*, provides all the 3, type-of-service = bike-repair, time = 4pm, date = today's date + 1, hence can be directly serviced, i.e. this can send apt information to the client, i.e. our android app , which will then make a booking accordingly.
         3. on receiving partial information although, *i'd like to book an appointment at 2 pm on Friday*, we don't receive the type of service. 
            1. entities can be marked as required(compulsory in the end-user expression)
            2. thus, if the end-user misses to give information on required entity/ties, DialogFlow can simply prompt the end-user for the missed out necessary information.
            3. in this example, since the type-of-service is missing, DialogFlow will detect this and prompt the user regarding the same.
            4. this prompt can be *customised*, and is called **slot-filling**.
            5. hence, for the above request, DialogFlow will prompt for *What type service does the bike need?*  to which the end-user may reply *It has a puncture*.
      3. end-user can also change the things they had previously said, all because of **slot-filling**
         1. User: I want an appointment
            DF(DialogFlow): What type of service does your bike need?
            User: It has a puncture.
            DF: What date are you available?
            User: How about this Saturday?
            DF: What type would you prefer?
            User: Acutally, could we do 2pm on Friday?
            DF: Thanks. You are scheduled for an appointment of puncture on Friday at 2pm.
      4. linear dialogs work only when the user has specific requests, or the DialogFlow has only specific facts to collect.
   2. non-linear
      1. closer to actual conversation, many branches, twists and turns due to changes in context.
      2. User: I'd like to book an appointment at 4 for a puncture repair, tomorrow.
         DF: So i'm booking you for a puncture repair tomorrow at 4pm. Is that right?(*Active context: confirm repair=output context*)
         User: Yes(Input-context = confirm-repair, output-context: confirm-reminder).
         DF: Should i send you a reminder?(*Active context: confirm-repair, confirm-reminder*)
         USer: Yes, please.
         DF: Well. See you at Friday.(*Active context: confirm-repair, confirm-reminder*)
      3. input-output contexts are string names given by the developer, and once a specific set of input and output context(s) are active, what to do then is also left at the hands of the developer.
         1. hence in this case the developer has to receive the answer(`repair.yes`/`repair.no` and `reminder.yes`/`reminder.no`) that DialogFlow itself received when input-context=confirm-repair and output-context=confirm-reminder,  and then .
         2. intent matching is done based on what input-context(s)  and output-context(s) are active
         3. hence the intent `Repair.yes` is matched, once its known that input-context=confirm-repair and output-context=confirm-reminder are active.
      4. book a repair Intent is matched when DF detects that the output-context confirm-repair is active
         1. this is active when all required details are provided by the query of the end-user
      5. when an Intent is matched, its output-context is added to the *current conversation state*, hence now all-active-contexts = *confirm-repair*
      6. `repair.yes` and `repair.no` match only after their parent-intent, i.e. Book repair intent is matched
         1. and similarly `Reminder.yes` and `Reminder.no` intents are matched only if their parent `repair.yes` is matched
3. Contexts also supply a bias to intent-matching
   1. if end-user experience's input-context matches an intent's input-context, high change of this intent being matched
4. Contexts **expire after 20 minutes usually**
   1. its upto the developer as to how much time should the effects of contexts last
5. intent-output-context = update/remove currently applied context





# Follow-up Intent<a name="follow-up intent"></a>

1. shortcut to common usage of context(hierarchical usage specifically)
2. only triggered after its parent-intent is matched.
3. In the above non-linear dialog
   1. once `book repair` intent is matched, the `repair.yes` and `repair.no` can be triggered
   2. once `repair.yes` is matched, `send reminder` intent can be matched
   3. once `send reminder` is matched, `reminder.yes` and `reminder.no` could be matched
   4. matching and triggering **are different**, 
      1. matched - all contexts match, this is what the user is wanting, according to DF
      2. triggered - this is one of the candidate requests of the user, i.e. candidate events that can be matched.
4. **if suppose no intent matches** , a **default-fallback** intent is matched
   1. follow-up intents to this one can be added by the developer
   2. `DialogFlow ES` already gives us a pre-built Default-Fallback intent.





# FulFillment<a name="fulfillment"></a>

1. control DialogFlow's conversations programmatically, this is used.
2. create a web-server with a *single HTTP point*
   1. called as a *web-hook*
   2. here the custom logic is coded
   3. fulfillment has to be **enabled** for desired intents by the developer
   4. each intent can be given some action so that the fulfillment knows which was triggered.
   5. on intent-matching, DF sends json-request to web-hook that contains end-user information with regards to that intent(what that intent could collect = values extracted + action-names)
   6. 1-click integration available for - messenger, slack, facebook, twitter, skyp, telegram and more
   7. response, if generated, would be sent to the user, via DF.
3. web-hooks can also be used to *set and remove parameter values and contexts*





* NLU = subset of NLP, which is a subset of ASR/TTS(text-to-speech), it goes a step further to understand conversations it has not been trained on(errors, spelling mistakes, accents, sentiments...).
* works with both voice and text
* We recommend that you create separate projects for experiments, testing, and production. Each project can only create one [Dialogflow Agent](https://cloud.google.com/dialogflow/docs/agents-overview). If you need multiple agents, you will need to create multiple projects.











# Project setup

```bash
# install gcloud SDK
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-316.0.0-linux-x86_64.tar.gz
```



1. Create Agent 
   1. entire chatbot application
   2. mapping end-user experience to Intent is done by this
   3. `utterance` is the trigger event for starting up this agent
   4. hence the phrase *Ok Google, play some music* is the utterance, but just the phrase **Ok Google** is the trigger for the welcome-intent/first task to begin.
2. [MyfirstAgent](https://dialogflow.cloud.google.com/#/agent/myfirstagent-dykk/intents)
3. Intent Matching
   1. The model checks the expression against every intent in the agent, gives every intent a score, and the highest scoring intent is matched. 
   2. If the highest scoring intent has a very low score, the fallback intent is matched.
4. When building an agent, you control how data is extracted by *annotating parts of your training phrases* and configuring the associated parameters.
5. Dialogflow automatically detects parameters in training phrases that are recognized as *system entities*. 
   1. These are entities provided by Dialogflow for many common data types like location, color, and date.
   2. a developer can obviously create their own *custom entities* .
   3. isList = is the parameter a list type entity(while adding `action and parameters` to an intent, this can be seen)
   4. The value of a parameter can be used in your responses. 
      1. For example, you can use the `$language` parameter reference in your responses when building an agent. 
      2. At runtime, it will be replaced with the language specified in the end-user expression.
      3. we can also add *prompts* to a parameter-and-action entry, so that even if the intent is matched, but the entity(ies) fail to be extracted from end-user's experience, the end-user is notified of this failure, and as a fail-safe is asked these prompts.
6. Custom Entity
   1. reference-value + synonyms
   2. 