import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  int _likes = 0;
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likes += _isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLike,
      child: Row(
        children: [
          Icon(
            Icons.favorite_border_outlined,
            size: 15,
            color: _isLiked ? Colors.red : Colors.grey,
          ),
          const SizedBox(width: 5),
          Text('$_likes like'),
        ],
      ),
    );
  }
}