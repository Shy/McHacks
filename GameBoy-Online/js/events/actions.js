var epp = new Firebase('https://everyoneplayspokemon.firebaseio.com');
var submissions = epp.child('submissions');

submissions.on('child_added', function(submissionSnapshot) {
	var submission = submissionSnapshot.val();
	GameBoyKeyDown(submission.action, function() {
    if (submission.sender_phone) {
      $.post(
        'http://everyoneplayspokemon.com/back_mms',
        {
          recipient: submission.sender_phone,
          canvas_dump: document.getElementById("mainCanvas").toDataURL()
        }
      );
    }
  });
});
