class QuizQuestion {
  const QuizQuestion(this.text,this.answers);
  final String text;
  final List<String> answers;

// List<String> get shuffledAnswerOrder() {                // if we write like this then we can access this method like a property like this :  ...currentQuestion.shuffledAnswerOrder.map(
// or
  List<String> myShuffledAnswerOrder() {    // here myShuffledAnswerOrder method is returns a list of strings and it change the order of list's variables(answers).
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

// Note: .shuffle() : it used to change the order of list items
//       .where() :  it used to  filter a list to create a new list that contains the list entries where a certain condition is met
//       .add() :  it used to add new entries to a list
//       .map() :  it used to generate a new list of transformed list items
//       ... :  it used to pull all the list elements out of a list and add them as standalone comma separated items to surrounding list.