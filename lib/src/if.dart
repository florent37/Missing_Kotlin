///
/// .kt
/// return if(expression) {
/// 	value1
/// } else {
/// 	value2
/// }
///
/// .dart
/// return IF(expression, (){
/// 	return value1;
/// }, else: (){
/// 	return value2;
/// });
///
/// .dart
/// return IF(expression,
/// 		() => value1,
/// 	else:
/// 		() => value2
/// );
///
/// .kt
/// return if(expression) {
/// 	value1
/// } else if(expression2){
/// 	value2
/// } else {
/// 	value3
/// }
///
/// .dart
///
/// return IF(expression,
/// 		() => value1,
/// 	else: (){
/// 		IF(expression2,
/// 			() => value2,
/// 			else: () => value2,
/// 		);
/// });
///
/// //test it
/// return IF(expression,
/// 		() => value1,
/// 	else: IF(expression2,
/// 			() => value2,
/// 			else: () => value2,
/// 	);
/// });
R If<R>(bool expression, R Function() success, {R Function() Else}){
  if(expression){
    return success();
  } else {
    return Else();
  }
}