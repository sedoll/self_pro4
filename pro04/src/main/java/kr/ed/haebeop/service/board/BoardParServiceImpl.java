package kr.ed.haebeop.service.board;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.Report;
import kr.ed.haebeop.repository.BoardParRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardParServiceImpl implements BoardService{

    @Autowired
    private BoardParRepositoryImpl boardParRepository;

    @Override
    public List<Board> boardList() throws Exception {
        return boardParRepository.boardList();
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        return boardParRepository.boardDetail(bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        boardParRepository.boardInsert(dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        boardParRepository.boardDelete(bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        boardParRepository.boardEdit(dto);
    }

    @Override
    public void countUp(int bno) throws Exception {

    }

    @Override
    public List<Board> commentList(int bno) throws Exception {
        return boardParRepository.commentList(bno);
    }

    @Override
    public void commentInsert(Board dto) throws Exception {
        boardParRepository.commentInsert(dto);
    }

    @Override
    public void commentDeleteAll(int bno) throws Exception {
        boardParRepository.commentDeleteAll(bno);
    }
    @Override
    public List<Board> allCommentList() throws Exception {
        return boardParRepository.allCommentList();
    }
    @Override
    public void reportBoard(Report report) throws Exception {
        boardParRepository.reportBoard(report);
    }

    @Override
    public int checkReported(Report report) throws Exception {
        return boardParRepository.checkReported(report);
    }
    @Override
    public List<Board> boardReportList() throws Exception {
        return boardParRepository.boardReportList();
    }
    @Override
    public List<Board> recentReportList() throws Exception {
        return boardParRepository.recentReportList();
    }
}
