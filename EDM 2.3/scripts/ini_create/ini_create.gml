function ini_create() {

layout_normal();
ini_teebox();
//

recent_scores_array = [];
included_scores_array = [];

round_selection = 20;
top_scores = 8;
ghin_index = 0;

handicap_trend_type = 0;

stat_tee_index = undefined;
stat_index = 0;
tee_index = undefined;

course_struct = undefined;
score_struct = undefined;

subcourse_index = 0;
course_index = undefined;
score_index = undefined;

scr_handicap_calculate();

exit
cs(js(PROFILE_data.activeRound))
sm(PROFILE_data.activeRound);
}
