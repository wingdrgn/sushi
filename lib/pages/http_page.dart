import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Fail to load Album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(userId: userId, id: id, title: title),
      _ => throw const FormatException('Fail to load Album'),
    };
  }
}

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  final ScrollController _scrollController = ScrollController();
  List<Album> _albums = [];
  bool _isLoading = false;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _fetchAlbums();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchAlbums();
      }
    });
  }

  Future<void> _fetchAlbums() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate API call
      final newAlbums = await fetchAlbums(_page);
      setState(() {
        _albums.addAll(newAlbums);
        _page++;
      });
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<List<Album>> fetchAlbums(int page) async {
    // Replace with your API call logic
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/albums?_page=$page&_limit=20'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _albums.length + 1,
        itemBuilder: (context, index) {
          if (index == _albums.length) {
            return _isLoading
                ? Container(
                    width: 50,
                    height: 50,
                    child: const CircularProgressIndicator(),
                  )
                : const SizedBox.shrink();
          }
          final album = _albums[index];
          return ListTile(
            title: Text(album.title),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
