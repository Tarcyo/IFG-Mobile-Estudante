import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class MaterialCard extends StatelessWidget {
  final String materialName;
  final String activityType;
  final String uploadDate;
  final String fileExtension;

  MaterialCard({
    required this.materialName,
    required this.activityType,
    required this.uploadDate,
    required this.fileExtension,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: screenWidth * 0.045),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: screenWidth * 0.25,
                width: screenWidth * 0.25,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(screenWidth * 180)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _fileIcon(fileExtension),
                        color: backgroundColor,
                        size: screenWidth * 0.15,
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Abrir",
                            style: TextStyle(
                              color: backgroundColor,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.assignment,
                            color: mainColor, size: screenWidth * 0.056),
                        Text(
                          " " + materialName,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Row(
                      children: [
                        Icon(Icons.description,
                            size: screenWidth * 0.056, color: messageTextColor),
                        Text(
                          " " + activityType,
                          style: TextStyle(
                            color: messageTextColor,
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                      width: screenWidth * 0.02,
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_month,
                            color: messageTextColor, size: screenWidth * 0.056),
                        Text(
                          " " + uploadDate,
                          style: TextStyle(
                            color: messageTextColor,
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconData _fileIcon(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    return _mapIcons[extension] ?? Icons.insert_drive_file;
  }

  // Lista/Mapa com todos os icones
  final Map<String, IconData> _mapIcons = {
    'txt': Icons.description,
    'p': Icons.description,
    'docx': Icons.book,
    'pdf': Icons.picture_as_pdf,
    'jpg': Icons.image,
    'png': Icons.image,
    'mp3': Icons.music_note,
    'mp4': Icons.video_call,
    'xls': Icons.table_chart,
    'ppt': Icons.slideshow,
    'zip': Icons.archive,
    'html': Icons.code,
    'css': Icons.style,
    'js': Icons.code,
    'dart': Icons.code,
    'avi': Icons.movie,
    'json': Icons.code,
    'xml': Icons.code,
    'php': Icons.code,
    'exe': Icons.desktop_windows,
    'gif': Icons.gif,
    'svg': Icons.image_aspect_ratio,
    'doc': Icons.library_books,
    'pptx': Icons.slideshow,
    'xlsx': Icons.table_chart,
    'java': Icons.code,
    'cpp': Icons.code,
    'py': Icons.code,
    'c': Icons.code,
    'bat': Icons.code,
    'html5': Icons.code,
    'css3': Icons.style,
    'ts': Icons.code,
    'vue': Icons.code,
    'npm': Icons.code,
    'yarn': Icons.code,
    'docker': Icons.code,
    'swift': Icons.code,
    'ruby': Icons.code,
    'scala': Icons.code,
    'go': Icons.code,
    'lua': Icons.code,
  };
}
