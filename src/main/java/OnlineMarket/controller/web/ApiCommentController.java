package OnlineMarket.controller.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import OnlineMarket.listener.OnCommentApprovedEvent;
import OnlineMarket.result.api.ResponseResult;
import OnlineMarket.service.CommentService;
import OnlineMarket.util.exception.CustomException;

@RestController
@RequestMapping("/api/comment")
public class ApiCommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    ApplicationEventPublisher eventPublisher;

    @RequestMapping(value = "/modify-status", method = { RequestMethod.POST,
            RequestMethod.GET })
    public ResponseEntity<?> checkSlugUnique(@RequestParam(value = "id") Integer id, HttpServletRequest request) {
        boolean error = false;
        String message = "";
        try {
            eventPublisher.publishEvent(new OnCommentApprovedEvent(commentService.activeComment(id), request));
        } catch (CustomException e) {
            error = true;
            message = e.getMessage();
        }

        return ResponseEntity.ok(new ResponseResult(error, message));
    }

}
