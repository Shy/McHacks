var epp = new Firebase('https://everyoneplayspokemon.firebaseio.com');
var submissions = epp.child('submissions');

submissions.on('child_added', function(submissionSnapshot) {
	var submission = submissionSnapshot.val();
	GameBoyKeyDown(submission.action);
});